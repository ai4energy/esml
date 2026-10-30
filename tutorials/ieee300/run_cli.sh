#!/bin/sh
# IEEE 300 潮流：命令行一次性求解。
#   sh run_cli.sh /path/to/esml-academic-1.8.0-linux-x86_64
set -eu
home=${1:?usage: run_cli.sh /path/to/esml-academic-1.8.0-linux-x86_64}
"$home/esml" solve \
  "$home/library/domains/power/cases/case300.comp.esml" \
  -L "$home/library" --json
