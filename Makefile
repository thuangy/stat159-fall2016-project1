# type 'make' in the console to run these commands

# target (filename or all): dependencies (other files)
	#command

# variables
out = paper/paper.html
outmd = paper/paper.md
# wildcard function so that the * can be used
mds = $(wildcard paper/sections/*.md)
imgs = $(wildcard images/*.png)



# tells make that 'all' and 'clean' are not names of files
.PHONY: all clean

# all should be the first target, the main target (first to be executed)
all: $(out) $(outmd)

$(outmd): $(mds) $(imgs)
	cat $(mds) > $@

$(out): $(outmd)
	pandoc -s $(outmd) -o $@
# the @ symbol is an automatic variable that corresponds to the name of the target


# special target, typically doesn't have any dependencies, used to remove things
# run this with 'make clean' in the console
clean: 
	rm -f $(outmd) $(out)