#!/bin/bash
set -eux

echo "Please run ./tools/ssg/generate.sh manually."

# TODO: CNAME
cp CNAME dist/

# できれば Ruby の gem で統一したかったけど一旦 npm で
npx gh-pages -d dist
