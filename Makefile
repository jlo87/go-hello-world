.PHONY: all build clean update static static-test-server test test-server test-gui

all: build

build: build-server

test: test-server

static: static-test-server

## PROJECT BUILD
build-server:
	go build -ldflags "-X main.buildVersion=$(RPM_VERSION) -X main.gitCommit=$(GIT_COMMIT)" hello.go

## UNIT TESTS
test-server:
	go test ./hello

test-web:
	@echo "NOT YET IMPLEMENTED (polymer test)"

static-test-server:
	go vet ./
