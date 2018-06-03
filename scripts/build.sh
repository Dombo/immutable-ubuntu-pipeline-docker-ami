#!/usr/bin/env bash

# Magic variables
__dir="$(cd "$(dirname "${BASH_SOURCE[-0]}")" && pwd)"
__parent="$(dirname ${__dir})"

# Source the bundled .env
set -a
[[ -e $__parent/.env ]] && source $__parent/.env || $CI
set +a

set -o pipefail -e
( packer validate $__parent/template.json )
( packer build $__parent/template.json )