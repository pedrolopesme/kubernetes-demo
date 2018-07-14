GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
GOFMT=$(GOCMD)fmt
BINARY_NAME=$(GOPATH)/bin/demo-api
BINARY_UNIX=$(BINARY_NAME)_unix

build: 
	@echo "Building API"
	$(GOBUILD) -o $(BINARY_NAME) -v

build-docker:
	@echo "Building docker image"
	docker build -t demo-api .

run:
	@echo "Running"
	$(GOBUILD) -o $(BINARY_NAME)
	$(BINARY_NAME) $(filter-out $@,$(MAKECMDGOALS))

fmt:
	@echo "Running gofmt for all project files"
	$(GOFMT) -w *.go
