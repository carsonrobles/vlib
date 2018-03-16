`define CNT_MAX 20'h3a980

module servo_drv (
    input  wire clk,

    input  wire [19:0] pos,

    output reg  srv_o = 1'b0
);

    reg [19:0] cnt = 20'h0;

    always @ (posedge clk) begin
        if (cnt < `CNT_MAX)
            cnt <= cnt + 20'h1;
        else
            cnt <= 20'h0;
    end

    always @ (posedge clk) begin
        if (cnt < pos)
            srv_o <= 1'b1;
        else
            srv_o <= 1'b0;
    end

endmodule
