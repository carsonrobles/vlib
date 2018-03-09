`timescale 1 ns / 10 ps

module ram_tb;

	reg        clk   = 1'b0;
	reg        wr_en = 1'b0;
	reg  [7:0] d_in  = 8'h0;
	reg  [7:0] addr  = 8'h0;
	wire [7:0] d_out;

	ram uut (
		.clk   (clk  ),
		.wr_en (wr_en),
		.d_in  (d_in ),
		.addr  (addr ),
		.d_out (d_out)
	);

	always #5 clk <= ~clk;

	always @ (posedge clk) begin
		d_in <= #1 d_in + 8'h1;

		if (&(addr[2:0])) addr <= #1 8'h0;
		else              addr <= #1 addr + 8'h1;
	end

	initial begin
		$dumpfile("ram_tb.vcd");
		$dumpvars;

		#50  wr_en <= 1'b1;
		#300 wr_en <= 1'b0;

		#50

		$display("simulation done");
		$finish;
	end

endmodule