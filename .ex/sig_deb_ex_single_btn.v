///////////////////////////////////
//
//  Carson Robles
//  Jan 22, 2018
//
//  example use of sig_deb module
//
//  this example will be a module that keeps track of a 4-bit value
//  that is incremented once everytime the button (btn) is pressed.
//  the 4-bit value will be used to drive 4 leds as the output of the module.
//
///////////////////////////////////

module sig_deb_ex_single_btn (
	input  wire 	  clk,				// system clock
	input  wire 	  rst_n,			// active low reset signal

	input  wire       btn,				// button to read from

	output wire [3:0] led				// leds to display 4-bit count
);

	reg [3:0] cnt = 4'h0;				// internal count to be displayed on leds
	reg [1:0] sft = 2'h0;				// shift register to be used as an edge detector for the button signal

	wire 	  btn_d;					// debounced button signal

	// instantiate signal debouncer
	sig_deb #(
		.CLKS_PER_SMPL (16   ),
		.SMPL_CNT      (4    )
	) sd (
		.clk 		   (clk  ),
		.i_sig         (btn  ),
		.o_sig         (btn_d)
	);

	// shift in button data
	always @ (posedge clk or negedge rst_n) begin
		if (~rst_n) sft <= 4'h0;
		else        sft <= (sft << 1) | btn_d;
	end

	wire inc = ~sft[1] & sft[0];

	// increment cnt when posedge of btn_d detected
	always @ (posedge clk or negedge rst_n) begin
		if (~rst_n) begin
			cnt <= 4'h0;
		end else begin
			cnt <= cnt + {3'h0, inc};	// if edge is detected this will increment cnt
		end
	end

	assign led = cnt;					// assign the count to the output leds

endmodule