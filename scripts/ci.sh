#!/bin/bash
#
# Lint shell scripts.
#
set -e

echo 'Linting shell scripts using'
echo 'https://github.com/dcycle/docker-shell-lint'
echo 'To ignore rules'
echo '# shellcheck disable=SC2016'
echo ''

find . -name "*.sh" -print0 | \
  xargs -0 docker run -v "$(pwd)":/code dcycle/shell-lint:2

echo ' => SHELL SCRIPTS OK!'
echo ''
