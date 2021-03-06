`define SERVO_DRV_CNT_MAX 20'h3a980

module servo_drv (
    input  wire        clk,

    /*input  wire [7:0] pos,        will be implemented when decoder is done */

    input  wire [14:0] on_t,

    output reg         srv_o = 1'b0
);

    /*wire [14:0] on_t;

    servo_pos_dcd dcd (
        .pos  (pos ),
        .on_t (on_t)
    );                              will be implemented when decoder is done */

    reg [19:0] cnt = 20'h0;

    always @ (posedge clk) begin
        if (cnt < `SERVO_DRV_CNT_MAX) cnt <= cnt + 20'h1;
        else                          cnt <= 20'h0;
    end

    always @ (posedge clk) begin
        if (cnt < {5'h0, on_t}) srv_o <= 1'b1;
        else                    srv_o <= 1'b0;
    end

endmodule
