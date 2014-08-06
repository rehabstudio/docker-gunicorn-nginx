ENV=live
TAG=rehabstudio/pythonproject

help:
	@echo "\nall - Build & run a fresh Container"
	@echo "build-container - Build Container"
	@echo "run-container - Run Container"
	@echo "remove-container - Remove Container"
	@echo "\nGLOBAL ARGS (ENV=local, TAG=rehabstudio/pythonproject)"
	@echo "\neg. make all ENV=live TAG=myapp\n"

all: build run

build:
	@docker build -t="$(TAG)" .

run:
	@docker run -P -v=$(CURDIR)/app/:/var/app:rw -d -e ENV=$(ENV) $(TAG)

remove:
	-@docker rmi $(TAG)
