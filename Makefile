
.PHONY: all

all: test run 

base:
	docker build -f KexStandaloneBase -t abdullin/kex-standalone:base .

test: base
	docker build -f KexStandaloneTest -t abdullin/kex-standalone:test .

run: base
	docker build -f KexStandaloneRun -t abdullin/kex-standalone:run .