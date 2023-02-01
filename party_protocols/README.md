# GRPC Protocols

## Network Architecture
All service listens 127.0.0.1, 

only traefik listens 0.0.0.0's 443 port, 

`traefik` do a map, convert `domain(https url) request` to `localhost IP request`. And for those requests that can't pass the header JWT authentication, we drop it

> Only Linux supports docker `host` mode, which is the easiest way to manage the network.

## Port Design

### redis
* livekit: 0
* account authentication service: 1

### Internal API Service
> It is used for all those APIs that every internal service can call. Here the 'internal service' means those services that was hidden behinds the Docker Firewall.

> internal_api.weloveparty.domain.local

#### GRPC
    rust: 40050 

### Account Authentication Service

> auth.weloveparty.domain.local

#### Restful
    python: 40051

#### GRPC
    python: 40052

### Account Storage Service

> account_storage.weloveparty.domain.local

#### GRPC
    golang: 40053

### Room Control Service

> room_control.weloveparty.domain.local

#### GRPC
    typescript: 40054

    livekit_built-in_control_service: 7880

    livekit_webRTC_ports:
        * tcp: 7881
        * udp: 50000 - 60000

    > `docker run --rm -it -v $PWD/livekit_config:/output livekit/generate`

    ```
    * 7880 - builtin_livekit_control_service
    * 7881 - for WebRTC over TCP
    * 50000-60000/UDP - for WebRTC over UDP

    > It'll try UDP first, then TCP

    Server URL: wss://livekit.weloveparty.domain.local
    API Key: APIDtk2LyAaZPWA
    API Secret: LXo3sftMbII4YqV4bawJu1MrsfL1oOfjexZkqrGm1pkA

    Here's a test token generated with your keys:
    eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTA1NTgwNTgsImlzcyI6IkFQSUR0azJMeUFhWlBXQSIsImp0aSI6InRvbnlfc3RhcmsiLCJuYW1lIjoiVG9ueSBTdGFyayIsIm5iZiI6MTY3NDU1ODA1OCwic3ViIjoidG9ueV9zdGFyayIsInZpZGVvIjp7InJvb20iOiJzdGFyay10b3dlciIsInJvb21Kb2luIjp0cnVlfX0._jFBec7bBrHWm8SHG-vUCyiK5ym58RcKAOycKSRHMp4
    ```

### Free Map Service
> free_map.weloveparty.domain.local

#### GRPC
    typescript: 40055


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

mkdir -p ./generated_grpc/

protoc --go_out=generated_grpc --go-grpc_out=generated_grpc --proto_path ../party_protocols/protocols account_storage_service.proto

#protoc --go_out=generated_grpc/account_auth_service --go-grpc_out=generated_grpc/account_auth_service --go_opt=paths=source_relative --go-grpc_opt=paths=source_relative --proto_path ../party_protocols/protocols account_auth_service.proto
```

### Flutter
```bash
mkdir -p lib/generated_grpc

protoc --dart_out=grpc:lib/generated_grpc --proto_path ../party_protocols/protocols account_auth_service.proto account_storage_service.proto room_control_service.proto
```

### Rust
```rust
#build.rs

fn main() -> Result<(), Box<dyn std::error::Error>> {
    tonic_build::compile_protos("./protocols/internal_api_service.proto")?;

    Ok(())
```

```bash
cd ../rust_interval_api_system

mkdir protocols
cp -Rf ../party_protocols/protocols/internal_api_service.proto ./protocols/

cargo build --bin server
```


### Typescript For Node.js
```bash
yarn add protobufjs long

yarn add -D grpc-tools --ignore-scripts
pushd node_modules/grpc-tools
node_modules/.bin/node-pre-gyp install --target_arch=x64
popd

yarn add -D grpc-tools ts-proto

INPUT_DIR="../party_protocols/protocols"
OUT_DIR="./src/generated_grpc"

PROTO_FILE="room_control_service.proto"
./node_modules/.bin/grpc_tools_node_protoc \
  --plugin=protoc-gen-ts_proto=./node_modules/.bin/protoc-gen-ts_proto \
  --ts_proto_out="${OUT_DIR}" \
  --ts_proto_opt=outputServices=nice-grpc,outputServices=generic-definitions,useExactTypes=false \
  --proto_path="${INPUT_DIR}" \
  "${PROTO_FILE}"

PROTO_FILE="internal_api_service.proto"
./node_modules/.bin/grpc_tools_node_protoc \
  --plugin=protoc-gen-ts_proto=./node_modules/.bin/protoc-gen-ts_proto \
  --ts_proto_out="${OUT_DIR}" \
  --ts_proto_opt=outputServices=nice-grpc,outputServices=generic-definitions,useExactTypes=false \
  --proto_path="${INPUT_DIR}" \
  "${PROTO_FILE}"
```

```bash
brew install protobuf@3
brew link --overwrite protobuf@3

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
    --proto_path ../party_protocols/protocols \
    --plugin="protoc-gen-ts=${PROTOC_GEN_TS_PATH}" \
    --plugin=protoc-gen-grpc=${PROTOC_GEN_GRPC_PATH} \
    --js_out="import_style=commonjs,binary:${OUT_DIR}" \
    --ts_out="service=grpc-node,mode=grpc-js:${OUT_DIR}" \
    --grpc_out="grpc_js:${OUT_DIR}" \
    room_control_service.proto internal_api_service.proto
```

### Java/Kotlin

```bash
cd .gradle
wget https://repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-java/1.46.0/protoc-gen-grpc-java-1.46.0-osx-x86_64.exe
chmod 777 protoc-gen-grpc-java-1.46.0-osx-x86_64.exe
cd ..

mkdir -p app/src/main/java/generated_grpc

protoc --plugin=protoc-gen-grpc-java=.gradle/protoc-gen-grpc-java-1.46.0-osx-x86_64.exe \
--java_out=app/src/main/java --grpc-java_out=app/src/main/java \
--proto_path=../party_protocols/protocols free_map_service.proto
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
