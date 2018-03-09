///////////////////////////////////
//
//  Carson Robles
//  Jan 24, 2018
//
//  example use of sig_deb module
//
//  this example will be a module that keeps track of a 4-bit value
//  each bit in the value will correspond to a button.
//  when a button is pressed it will toggle the value of its corresponding bit.
//  this value will then be shown on the 4 output leds
//
///////////////////////////////////

module sig_deb_ex_multi_btn (
	input  wire 	  clk,				// system clock

	input  wire [3:0] btn,				// button to read from

	output wire [3:0] led				// leds to display 4-bit count
);

	wire [3:0] btn_d;					// debounced button signals

	// generate all 4 button debouncers
	generate
		genvar i;
		
		for (i = 0; i < 4; i = i + 1) begin
			sig_deb # (
				.CLKS_PER_SMPL (16      ),
				.SMPL_CNT      (4       )
			) sd (
				.clk           (clk     ),
				.i_sig         (btn[i]  ),
				.o_sig         (btn_d[i])
			);
		end
	endgenerate

	reg [1:0] sft [0:3];				// shift register array

	// initialize to 0's
	initial begin
		integer i;

		for (i = 0; i < 4; i = i + 1) begin
			sft[i] <= 4'h0;
		end
	end

	// shift in debounced signals for edge detection
	always @ (posedge clk) begin
		integer i;

		for (i = 0; i < 4; i = i + 1) begin
			sft[i] <= (sft[i] << 1) | btn_d[i];
		end
	end

	reg [3:0] cnt = 4'h0;				// internal count to be displayed on leds

	// toggle bit when edge detected
	always @ (posedge clk) begin
		integer i;

		for (i = 0; i < 4; i = i + 1) begin
			if (~sft[i][1] & sft[i][0]) cnt[i] <= ~cnt[i];
		end
	end

	// assign value to ouput leds
	assign led = cnt;

endmodule