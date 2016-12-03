VLOG     = ncverilog
SRC      = -f Datapath.f
VLOGARG  = +access+r
TMPFILE  = *.log verilog.key nWaveLog
DBFILE   = *.fsdb *.vcd *.bak
RM       = rm -rf

all :: simulation

simulation :
	$(VLOG) $(SRC) $(VLOGARG)
check :
	$(VLOG) -c $(SRC)
clean :
	$(RM) $(TMPFILE) $(DBFILE)

