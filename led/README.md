# LED Driver Modules

__16_wide_led__

* generates simple LED displays for a line of 16 LEDs

| PORT | TYPE | DESCRIPTION |
|------|:----:|-------------|
| clk  | I    | system clock |
| en   | I    | output enable |
| mod  | I    | selects which display to drive LEDs with (currently only has two modes) |
| led  | O    | 16 bit led output |

__sseg__
* Drives 4 digit seven segment display
* Can display digits 0-F
