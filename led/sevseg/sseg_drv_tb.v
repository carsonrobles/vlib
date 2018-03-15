`timescale 1 ns / 10 ps

module sseg_drv_tb;

	reg         clk = 1'b0;
	reg         en  = 1'b0;
	reg         mod = 1'b0;
	reg  [31:0] dat = 32'h0;
	wire [ 7:0] an;
	wire [ 7:0] seg;

	sseg_drv uut (
		.clk (clk),
		.en  (en ),
		.mod (mod),
		.dat (dat),
		.an  (an ),
		.seg (seg)
	);

	always #5 clk <= ~clk;

	initial begin
		$dumpfile("sseg_drv_tb.vcd");
		$dumpvars;

		#50  dat <= 32'h12345678;

		#50   en <= 1'b1;
		#100 mod <= 1'b1;
		#100 mod <= 1'b0;
		#100  en <= 1'b0;
		#50

		$display("simulation done");
		$finish;
	end

endmodule