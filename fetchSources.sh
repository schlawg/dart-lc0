#!/usr/bin/env -S bash -e

cd "$(dirname "${BASH_SOURCE:-$0}")"

if [ ! -d "eigen" ]; then
  git clone -b 3.3.7 --depth 1 https://gitlab.com/libeigen/eigen
fi
if [ ! -d "lc0" ]; then
  git clone -b v0.29.0 --depth 1 https://github.com/LeelaChessZero/lc0
  pushd lc0 > /dev/null
  git submodule update --init --recursive
  mkdir src/proto
  python3 scripts/compile_proto.py libs/lczero-common/proto/net.proto \
    --proto_path=libs/lczero-common/proto --cpp_out=src/proto
  git apply ../lc0.patch
  popd > /dev/null
fi
