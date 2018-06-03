#!/usr/bin/env bash

# Set magic variables for current directory
__dir="$(cd "$(dirname "${BASH_SOURCE[-0]}")" && pwd)"

# Source the bundled .env
set -a
source $__dir/.env || $CI
set +a

set -o pipefail -e
( packer validate $__dir/template.json )
( packer build $__dir/template.json )