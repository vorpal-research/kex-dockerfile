
.PHONY: all

VERSION=0.0.4

all: $(VERSION)

$(VERSION):
	docker build --build-arg version=$(VERSION) -f KexStandaloneRun -t abdullin/kex-standalone:$(VERSION) .
