SRCDIR = build/src/github.com/gogits/gogs
ROOTDIR = $(PWD)
OURGOPATH = $(ROOTDIR)/build

all : gogs/gogs

$(SRCDIR) :
	rm -rf build ; \
	mkdir -p $(SRCDIR) ; \
	cd $(SRCDIR)/.. ; \
	git clone https://github.com/cem/gogs gogs ; \
	GOPATH="$(OURGOPATH)" go get -tags "sqlite" github.com/gogits/gogs

update : $(SRCDIR)
	GOPATH="$(OURGOPATH)" go get -u -tags "sqlite" github.com/gogits/gogs

gogs/gogs : $(SRCDIR) custom scripts/build.sh
	rm -rf gogs ; ./scripts/build.sh && cp -r custom/ gogs/custom

clean :
	rm -rf gogs

