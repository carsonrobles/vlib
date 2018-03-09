
///////////////////////////////////
//
//  Carson Robles
//  Sep 13, 2016
//
//  random access memory
//
///////////////////////////////////

`define RAM_DEPTH (1 << ADDR_WIDTH)

module ram #(
    parameter ADDR_WIDTH = 8,                           /* address width */
    parameter DATA_WIDTH = 8                            /* data width */
) (
    input  wire                    clk,                 /* clock signal */

    input  wire                    wr_en,               /* write enable */
    input  wire [DATA_WIDTH - 1:0] d_in,                /* data in */
    input  wire [ADDR_WIDTH - 1:0] addr,                /* write/read address */

    output wire [DATA_WIDTH - 1:0] d_out                /* data out */
);

    reg [DATA_WIDTH - 1:0] mem [0:`RAM_DEPTH - 1];      /* declare internal memory */

    /* assign data out to internal memory at specified address */
    assign d_out = mem[addr];

    integer i;

    /* initialize ram to 0 */
    initial begin
        for (i = 0; i < `RAM_DEPTH; i = i + 1) begin
            mem[i] = {DATA_WIDTH{1'b0}};
        end
    end

    /* memory write */
    always @ (posedge clk) begin
        if (wr_en) mem[addr] <= d_in;
    end

endmodule

