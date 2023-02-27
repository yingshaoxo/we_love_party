# Golang User Storage System

This repo will handle the storage of a user.

For example, email address, username, head image and so on.

#### Usage

```bash
sudo apt install golang -y

#go get -d -u -t ./... && go mod tidy
go get

CGO_ENABLED=0 GRPC_GO_LOG_SEVERITY_LEVEL=info GRPC_GO_LOG_VERBOSITY_LEVEL=99 go run main.go
```

#### For developers

##### Test

```bash
go test tests/database_test.go #all test functions will run in a sequence way
```

##### Upload to server

```bash
rsync -avh --progress SourceDir/* username@remote_host:TargetDir/
```