# Signal Debouncer Modules

__sig_deb.v__

* debounces a potentially noisy signal and outputs the clean version once the input has settled
* currently designed to work for signals transitioning from low to high
* after being synchronized, the input signal is used as a synchronous reset for the shift register that determines when the input has settled
* can be customized by the number of clock cycles that pass between each sample point and by how many valid samples are needed to indicate a settled input signal

| PARAMETER | DESCRIPTION | DEFAULT |
|-----------|-------------|:-------:|
| CLKS_PER_SMPL | number of clock cycles between samples as a power of 2 (i.e. 2<sup>CLKS_PER_SMPL</sup>) | 16 |
| SMPL_CNT | number of valid samples to indicate a valid change from low to high | 4 |

| PORT | TYPE | DESCRIPTION |
|------|:----:|-------------|
| clk  | I | system clock |
| i_sig | I | input signal to be debounced |
| o_sig | O | debounced, output signal |
