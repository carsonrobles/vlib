module top (
    input  wire clk,

    output wire srv_o
);

    reg         st    = 1'b1;
    reg  [ 9:0] cnt   = 10'h0;

    reg  [14:0] pos_s = 15'h1770;

    always @ (posedge clk) begin
        cnt <= cnt + 10'h1;

        if (&cnt) begin
            if (pos_s > 15'h5dc0) st <= 1'b0;
            if (pos_s < 15'h1770) st <= 1'b1;

            if (st) pos_s <= pos_s + 15'h1;
            else    pos_s <= pos_s - 15'h1;
        end
    end

    servo_drv sd (
        .clk   (clk  ),
        .on_t  (pos_s),
        .srv_o (srv_o)
    );

endmodule
