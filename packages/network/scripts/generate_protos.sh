#!/bin/bash
# 生成 Protobuf Dart 代码
# 依赖：protoc（brew install protobuf）、protoc-gen-dart（dart pub global activate protoc_plugin）
set -e
cd "$(dirname "$0")/.."
mkdir -p lib/src/generated
export PATH="$PATH:$HOME/.pub-cache/bin"

# google/protobuf/any.proto 等 well-known 类型（与 import "google/protobuf/any.proto" 对应）
PROTOBUF_INCLUDE=""
if [ -d "/usr/local/opt/protobuf/include" ]; then
  PROTOBUF_INCLUDE="/usr/local/opt/protobuf/include"
elif command -v brew >/dev/null 2>&1; then
  BREW_PREFIX="$(brew --prefix protobuf 2>/dev/null || true)"
  if [ -n "$BREW_PREFIX" ] && [ -d "$BREW_PREFIX/include" ]; then
    PROTOBUF_INCLUDE="$BREW_PREFIX/include"
  fi
fi

EXTRA=()
if [ -n "$PROTOBUF_INCLUDE" ]; then
  EXTRA+=(-I "$PROTOBUF_INCLUDE")
fi

protoc --dart_out=lib/src/generated "${EXTRA[@]}" -I proto proto/app/v1/*.proto

# common.proto 使用 google.protobuf.Any 时，需单独生成 well-known 类型（否则缺少 any.pb.dart）
if [ -n "$PROTOBUF_INCLUDE" ] && [ -f "$PROTOBUF_INCLUDE/google/protobuf/any.proto" ]; then
  protoc --dart_out=lib/src/generated -I "$PROTOBUF_INCLUDE" \
    "$PROTOBUF_INCLUDE/google/protobuf/any.proto"
fi

echo "Generated protobuf code in lib/src/generated/"
