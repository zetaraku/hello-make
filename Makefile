# A makefile consists of "rules" in the following form:
# <target>: <dependency_target(s)>
# <TAB> some command to build the target file
# <TAB> ...or some command to be execute

# When making a target, 'make' requires all the dependency targets (files) to exist in advance.
# Otherwise, 'make' will make the dependencies by rules (if exists) of target, recursively.
# Furthermore, if the target already exists and ALL the dependencies are up-to-date (not modified since the previous make),
# the target will NOT be rebuilt, otherwise the target will be rebuilt.

# Dependencies can be non-file (phony) targets, in that case, the target will be built virtually.
# (the commands of target will be executed, but no target file will be required as a dependency.)

# specify the phony (pseudo) targets (targets that are not files):
.PHONY: main clean

main: hello_world		# the first target in the Makefile will be the default 'make' target
	# hello_world is built
	@# commands with '@' prepended will not be displayed

hello_world: hello.o world.o	# the linked executable named hello_world
	gcc hello.o world.o -o hello_world
hello.o: hello.c world.h 		# build the object file of hello.c (world.h is also a dependency)
	gcc -c hello.c
world.o: world.c world.h		# build the object file of world.c (world.h is also a dependency)
	gcc -c world.c

clean:		# a common pseudo (phony) target to clean up the side product
	rm -f hello_world *.o


# some usages from command line are:
# $ make				# make the default (first) target in ./Makefile
# $ make TARGET			# make the TARGET in ./Makefile
# $ make -f FILE		# use FILE as the Makefile to make

