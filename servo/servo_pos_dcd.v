`define SERVO_DCD_START 15'h0
`define SERVO_DCD_END   15'h0
`define SERVO_DCD_STEP  ((`SERVO_DCD_END - `SERVO_DCD_START) / 15'd180)

module servo_pos_dcd (
    input  wire [ 7:0] pos,     // position in degrees (0 to 180)

    output wire [14:0] on_t     // on time
);



endmodule
