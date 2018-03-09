module sig_deb_tb;

	reg  clk   = 1'b0;
	reg  i_sig = 1'b0;

	wire o_sig;

	sig_deb #(
		.CLKS_PER_SMPL (2),
		.SMPL_CNT      (2)
	) uut (
		.clk   (clk  ),
		.i_sig (i_sig),
		.o_sig (o_sig)
	);

	always #5 clk <= ~clk;

	initial begin
		$dumpfile("sig_deb_tb.vcd");
		$dumpvars;

		#50

		#1 i_sig <= 1'b1;
		#2 i_sig <= 1'b0;
		#1 i_sig <= 1'b1;
		#3 i_sig <= 1'b0;
		#1 i_sig <= 1'b1;
		#1 i_sig <= 1'b0;
		#1 i_sig <= 1'b1;
		#2 i_sig <= 1'b0;
		#1 i_sig <= 1'b1;
		#1 i_sig <= 1'b0;
		#1 i_sig <= 1'b1;
		#3 i_sig <= 1'b0;
		#1 i_sig <= 1'b1;
		#1 i_sig <= 1'b0;
		#2 i_sig <= 1'b1;
		#1 i_sig <= 1'b0;
		#2 i_sig <= 1'b1;

		#88 i_sig <= 1'b0;
		#5  i_sig <= 1'b1;

		#150

		$display("simulation done");
		$finish;
	end

endmodule