FLUTTER := flutter

.PHONY: help clean run test build-android

help:
	@echo "Makefile for aatv mobile application"
	@echo "Usage:"
	@echo "		make clean			- Clean the build artifacts"
	@echo "		make run				- Run flutter application"

clean:
	$(FLUTTER) clean

test:
	$(FLUTTER) test

run:
	$(FLUTTER) run

build-android: 
	$(FLUTTER) build apk

