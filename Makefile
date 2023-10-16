.PHONY: build clean deploy-development deploy-staging deploy-production test lint install-linter

build:
	cd uk-issues-mailer && env GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -ldflags="-s -w" -o ../bin/handler

clean:
	rm -rf ./bin

deploy-development: clean build
	STAGE=development serverless deploy --verbose

deploy-staging: clean build
	STAGE=staging serverless deploy --verbose

deploy-production: clean build
	STAGE=production serverless deploy --verbose

test: clean build
	cd uk-issues-mailer && go test ./...

lint:
	cd uk-issues-mailer && golangci-lint run
