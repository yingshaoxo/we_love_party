#!/bin/sh
cd /tmp
npm install grpc-tools --ignore-scripts --save-dev
pushd node_modules/grpc-tools
node_modules/.bin/node-pre-gyp install --target_arch=x64
popd