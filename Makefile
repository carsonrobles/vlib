VDIR=debounce led/16_wide_led led/sevseg ram servo

.PHONY : all
.PHONY : clean

all :
	@$(foreach vd, $(VDIR), echo "$(vd):"; make -C $(vd);)

clean :
	@$(foreach vd, $(VDIR), echo "$(vd):"; make -C $(vd) clean;)
