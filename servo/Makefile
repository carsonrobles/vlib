TOP=servo_drv.v
SRC=servo_pos_dcd.v
TST=$(TOP:.v=_tb.v)
EXE=$(TOP:.v=.out)
VCD=$(TST:.v=.vcd)
FLG=-DDEBUG

.PHONY : all
.PHONY : clean

all : $(EXE)

$(EXE) : $(TOP) $(SRC) $(TST)
	iverilog $(FLG) -o $(EXE) $(TOP) $(SRC) $(TST)

sim : $(EXE)
	vvp $(EXE)

vcd : $(EXE)
	vvp $(EXE) > /dev/null

wave : sim
	open -a gtkwave $(VCD)

clean :
	rm -f $(EXE) $(VCD)
