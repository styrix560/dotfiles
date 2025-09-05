#!/bin/bash

set -e
pushd $HOME/dot

git add .
git commit -m "Backup $(date +%Y/%m/%d)"
git push origin main

echo "Done sucessfully"
