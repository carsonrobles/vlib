
///////////////////////////////////
//
//  Carson Robles
//  Aug 31, 2016
//
//  led driver
//  shows an led light show
//
///////////////////////////////////

// if DEBUG is defined, cnt is smaller to allow for simulations that don't take ms of data
`define CNT_WIDTH 23

`ifdef DEBUG
    `define CNT_WIDTH 2
`endif

module led16_drv (
    input  wire        clk,     // clock signal

    input  wire        en,      // leds off when enable low
    input  wire        mod,     // mode to select pattern

    output wire [15:0] led      // output leds
);

    // shift in bit
    reg         s_in;

    // tick signal for sending next shift bit
    wire        tck;

    // 4-bit shift counter
    reg  [ 3:0] cnt_s = 4'h0;

    // left and right halves of led
    reg  [ 7:0] led_l = 8'h0;
    reg  [ 7:0] led_r = 8'h0;

    // final output value to be sent to enable condition
    wire [15:0] led_f;

    // tick counter
    reg  [`CNT_WIDTH - 1:0] cnt_t = `CNT_WIDTH'h0;

    // pulse when cnt_t full
    assign tck   = &cnt_t;

    // switch based on mode
    assign led_f = (mod == 1'b1) ? {led_r, led_l} : {led_l, led_r};
    // light show shows when enable is high, else lights out
    assign led   = (en == 1'b1) ? led_f : 16'h0;

    /* increment tick counter at clock edge */
    always @ (posedge clk) begin
        if (en == 1'b1) begin
            cnt_t <= cnt_t + `CNT_WIDTH'h1;
        end else begin
            cnt_t <= `CNT_WIDTH'h0;
        end
    end

    /* increment shift counter when tck is high */
    always @ (posedge clk) begin
        if (en == 1'b0) begin
            cnt_s <= 4'h0;
        end else begin
            if (tck == 1'b1) begin
                cnt_s <= cnt_s + 4'h1;
            end
        end
    end

    /* create s_in pattern */
    always @ (*) begin
        if (cnt_s[3:0] < 4'h3) begin
            s_in = 1'b1;
        end else begin
            s_in = 1'b0;
        end
    end

    /* shift in s_in bit if tick signal is high */
    always @ (posedge clk) begin
        if (en == 1'b0) begin
            led_l <= 8'h0;
            led_r <= 8'h0;
        end else begin
            if (tck == 1'b1) begin
                led_l <= {led_l[6:0], s_in};
                led_r <= {s_in, led_r[7:1]};
            end
        end
    end

endmodule

