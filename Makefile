.PHONY all build clean update static static-test-server static-test-web test test-server test-gui

all: build

build: build-server build-frontend build-swagger-doc

test: test-server test-web

static: static-test-server static-test-web

## PROJECT BUILD
build-frontend: update-go-deps
	go build -ldflags "-X main.buildVersion=$(RPM_VERSION) -X main.gitCommit=$(GIT_COMMIT)" hello.go

## UNIT TESTS
test-server: update-go-deps
	go test ./hello

test-web:
	@echo "NOT YET IMPLEMENTED (polymer test)"
