#!/usr/bin/env bash

printf "\n\n"
echo "# OPA - Open Policy Agent"
/opa version
printf "\n\n"

src=$INPUT_SOURCE
opt=$INPUT_OPTIONS
dst=$INPUT_TARGET

mkdir -p ${INPUT_TARGET%/*}

cwd=$PWD
cmd="cd $src && /opa build . --bundle --output $cwd/$dst $opt && cd $cwd"

e_code=0
echo "exec $cmd"
printf "\n"
eval "$cmd" || e_code=1

exit $e_code
