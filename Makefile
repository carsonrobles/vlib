VDIR=debounce led ram sevseg

.PHONY : all
.PHONY : clean

all :
	@$(foreach vd, $(VDIR), echo "$(vd):"; make -C $(vd);)

clean :
	@$(foreach vd, $(VDIR), echo "$(vd):"; make -C $(vd) clean;)
