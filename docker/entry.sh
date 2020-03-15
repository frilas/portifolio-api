#!/bin/sh

set -e

COMMAND="$1"

case "$COMMAND" in
  web)
    exec bundle exec rails s -p 3000 -b '0.0.0.0'
    ;;
  migrate)
    exec rake db:migrate
    ;;
  test)
    exec bundle exec rspec ./spec
    ;;
  *)
    exec sh -c "$@"
    ;;
esac
