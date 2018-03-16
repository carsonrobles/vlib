`define SERVO_DCD_START X'h0
`define SERVO_DCD_END   X'h0
`define SERVO_DCD_STEP  ((`SERVO_DCD_END - `SERVO_DCD_START) / X'd180)

module servo_dcd (
    input  wire pos,        // position in degrees (0 to 180)

    output wire dcd
);



endmodule
