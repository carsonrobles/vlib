# Random Access Memory Modules

__ram.v__

| PARAMETER | DESCRIPTION | DEFAULT |
|-----------|-------------|:-------:|
| ADDR_WIDTH | width of address used to access the RAM | 8 |
| DATA_WIDTH | width of data to be stored in the RAM | 8 |

| PORT | TYPE | DESCRIPTION |
|------|:----:|-------------|
| clk  | I | system clock |
| wr_en | I | write enable signal to write data d_in into the RAM at location addr |
| d_in | I | input data to be written into the RAM |
| addr | I | address to write to when wr_en is high, otherwise, address to read data from |
| d_out | O | data read from location addr |
