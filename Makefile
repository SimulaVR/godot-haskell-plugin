LIBFILE = $(shell stack path --local-install-root)/lib/libgodot-haskell-plugin.so
PROJECTROOT = $(shell stack path --project-root)
all:
	stack clean godot-haskell-plugin
	stack build
	cp $(LIBFILE) $(PROJECTROOT)
