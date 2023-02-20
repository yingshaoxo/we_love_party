mkdir protocols
cp -Rf ../party_protocols/protocols/internal_api_service.proto ./protocols/

cargo build --bin server --release