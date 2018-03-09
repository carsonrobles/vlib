`timescale 1 ns / 10 ps

module led16_drv_tb;

	reg         clk = 1'b0;
	reg         en  = 1'b0;
	reg         mod = 1'b0;
	wire [15:0] led;

	led16_drv uut (
		.clk (clk),
		.en  (en ),
		.mod (mod),
		.led (led)
	);

	always #5 clk <= ~clk;

	initial begin
		$dumpfile("led16_drv_tb.vcd");
		$dumpvars;

		#50  en <= 1'b1;

		#700 en <= 1'b0;
		#50

		$display("simulation done");
		$finish;
	end

endmodule