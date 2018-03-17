module servo_drv_tb;

    reg       clk = 1'b0;
    reg [7:0] pos = 8'h0;

    always #5 clk <= ~clk;

    servo_drv uut (
        .clk   (clk  ),
        .pos   (pos  ),
        .srv_o (srv_o)
    );

    initial begin
        $dumpfile("servo_drv_tb.vcd");
        $dumpvars;

        #500
        pos = 8'd90;
        #500

        $display("sim done");
        $finish;
    end

endmodule
