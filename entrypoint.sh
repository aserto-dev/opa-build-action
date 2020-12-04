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
cmd="/opa build . --bundle --output $cwd/$dst $opt"

e_code=0
cd $src
echo "exec $cmd"
printf "\n"
eval "$cmd" || e_code=1
cd $cwd

exit $e_code