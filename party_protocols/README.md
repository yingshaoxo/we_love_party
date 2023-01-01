# GRPC Protocols

## Network Architecture
All service listens 127.0.0.1, 

only traefik listens 0.0.0.0's 443 port, 

`traefik` do a map, convert `domain(https url) request` to `localhost IP request`. And for those requests that can't pass the header JWT authentication, we drop it

> Only Linux supports docker `host` mode, which is the easiest way to manage the network.

## Port Design

### Account Authentication Service
#### Restful
    python: 40051

#### GRPC
    python: 40052

### Account Storage Service
#### GRPC
    golang: 40053

<!-- ### Room Control Service
#### GRPC
    typescript: 40054

    livekit_control_service: 7880

    livekit_user_direct_connect_port: 
        * 7881 tcp
        * 7882 udp

### gateway (grpc)
    account service: 40054
    room controller: 40055

    web proxy:
        account service: 40056
        room controller: 40057 -->

## Generate GRPC Code (It's just for example, don't run it directly!)

### Python
```bash
brew install protobuf

export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1
export CFLAGS="-I/opt/homebrew/opt/openssl/include"
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"
python -m pip install grpcio grpcio-tools 

pip install "betterproto[compiler]==2.0.0b5"
poetry add "betterproto[compiler]==2.0.0b5"

mkdir src/generated_grpc
python -m grpc_tools.protoc --proto_path ../party_protocols/protocols --python_betterproto_out=src/generated_grpc account_auth_service.proto
```

### Golang
```bash
go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2

mkdir -p ./generated_grpc/account_auth_service

protoc --go_out=generated_grpc --go-grpc_out=generated_grpc --proto_path ../party_protocols/protocols account_auth_service.proto

#protoc --go_out=generated_grpc/account_auth_service --go-grpc_out=generated_grpc/account_auth_service --go_opt=paths=source_relative --go-grpc_opt=paths=source_relative --proto_path ../party_protocols/protocols account_auth_service.proto
```

### Flutter
```bash
cd flutter_client

mkdir -p lib/generated_grpc

protoc --dart_out=grpc:lib/generated_grpc --proto_path ../party_protocals/protocols helloworld.proto

protoc --dart_out=grpc:lib/generated_grpc --proto_path ../party_protocals/protocols account_service.proto


protoc --dart_out=grpc:lib/generated_grpc --proto_path ../party_protocals/protocols room_control_service.proto
cd ..
```

### Rust
```rust
#build.rs

fn main() -> Result<(), Box<dyn std::error::Error>> {
    tonic_build::compile_protos("../party_protocals/protocols/helloworld.proto")?;

    tonic_build::compile_protos("../party_protocals/protocols/account_service.proto")?;

    tonic_build::compile_protos("../party_protocals/protocols/room_control_service.proto")?;

    Ok(())
}
```

```bash
cd rust_service

cargo build --bin server

cd ..
```


### Typescript For Node.js
```bash
yarn add ts-protoc-gen@next -D

yarn add grpc-tools --ignore-scripts

pushd node_modules/grpc-tools
node_modules/.bin/node-pre-gyp install --target_arch=x64
popd


mkdir -p src/generated_grpc

PROTOC_GEN_TS_PATH="./node_modules/.bin/protoc-gen-ts"
PROTOC_GEN_GRPC_PATH="./node_modules/.bin/grpc_tools_node_protoc_plugin"
OUT_DIR="./src/generated_grpc"

protoc \
    --proto_path ../party_protocals/protocols \
    --plugin="protoc-gen-ts=${PROTOC_GEN_TS_PATH}" \
    --plugin=protoc-gen-grpc=${PROTOC_GEN_GRPC_PATH} \
    --js_out="import_style=commonjs,binary:${OUT_DIR}" \
    --ts_out="service=grpc-node,mode=grpc-js:${OUT_DIR}" \
    --grpc_out="grpc_js:${OUT_DIR}" \
    room_control_service.proto
```

## Run the service
```
- configs
    - user_database
    - redis_data
    config.py
    livekit.yaml
    o365_token.txt
```

```bash
docker-compose build
 
docker-compose up --force-recreate -d
docker-compose logs -f

docker-compose down --volumes    
```
