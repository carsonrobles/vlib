# LED Driver Modules

__led16_drv.v__

* generates simple LED displays for a line of 16 LEDs

| PORT | TYPE | DESCRIPTION |
|------|:----:|-------------|
| clk  | I    | system clock |
| en   | I    | output enable |
| mod  | I    | selects which display to drive LEDs with (currently only has two modes) |
| led  | O    | 16 bit led output |

example use:
``` verilog

module led16_ex (
	input  wire        clk,

	output wire [15:0] led
);

	reg [19:0] cnt = 20'h0;				// counter to produce delay in mode switch
	reg        mod = 1'b0;				// led mode

	// increment counter
	always @ (posedge clk) begin
		cnt <= cnt + 20'h1;
	end

	// toggle mode when counter fills
	always @ (posedge clk) begin
		if (&cnt) mod <= ~mod;
	end

	led16 led (
		.clk (clk ),
		.en  (1'b1),
		.mod (mod ),
		.led (led )
	);

endmodule

```