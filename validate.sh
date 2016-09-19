#!/bin/bash

set -e

which terraform > /dev/null 2>&1 || {
  echo "Aborted. Please install terraform by following https://www.terraform.io/intro/getting-started/install.html" 1>&2
  exit 1
}

path="$(dirname $0)"

dirs=$(
  find "${path}/terraform" -name "*.tf" -print0 \
    | xargs -0 -n1 dirname \
    | sort --unique
)

for dir in $dirs; do
  if ! terraform validate $dir; then
    echo "Invalid terraform config found in $dir"
  fi
done
