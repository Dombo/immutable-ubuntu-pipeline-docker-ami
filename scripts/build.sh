#!/usr/bin/env bash

# Magic variables
__dir="$(cd "$(dirname "${BASH_SOURCE[-0]}")" && pwd)"
__parent="$(dirname ${__dir})"

# Arguments
mode=${1}

# Source the bundled .env
set -a
[[ -e $__parent/.env ]] && source $__parent/.env || $CI
set +a

set -o pipefail -e
if [[ ${mode} = 'base' ]]; then
	( packer validate $__parent/packaging/base.json )
	( packer build $__parent/packaging/base.json )
fi;