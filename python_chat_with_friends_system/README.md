# python chat with friends system

Here I used python to make the friend list and chat service system.

## Env
```bash
curl -sSL https://install.python-poetry.org | python3 -

poetry shell

export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1
export CFLAGS="-I/opt/homebrew/opt/openssl/include"
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"
pip install grpcio grpcio-tools 

poetry export -f requirements.txt --output requirements.txt --without-hashes

pip install -r requirements.txt

echo 'Garbage Mac M1, M2, and so on...'
```

## Run
```bash
#grpc
poetry run dev

#test
poetry run test
```