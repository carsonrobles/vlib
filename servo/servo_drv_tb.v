module servo_drv_tb;

    reg clk = 1'b0;

    always #5 clk <= ~clk;

    servo_drv uut (
        .clk   (clk  ),
        .srv_o (srv_o)
    );

    initial begin
        $dumpfile("servo_drv_tb.vcd");
        $dumpvars;

        #1000

        $display("sim done");
        $finish;
    end

endmodule
