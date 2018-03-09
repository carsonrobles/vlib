SRC=sseg_drv.v
TST=$(SRC:.v=_tb.v)
EXE=$(SRC:.v=.out)
VCD=$(TST:.v=.vcd)
FLG=-DDEBUG

.PHONY : all
.PHONY : clean

all : $(EXE)

$(EXE) : $(SRC) $(TST)
	iverilog $(FLG) -o $(EXE) $(SRC) $(TST)

sim : $(EXE)
	vvp $(EXE)

vcd : $(EXE)
	vvp $(EXE) > /dev/null

wave : sim
	open -a gtkwave $(VCD)

clean :
	rm -f $(EXE) $(VCD)
