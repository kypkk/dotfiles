#!/bin/bash
set -x
# rm Brewfile Brewfile.lock.json
brew bundle dump --describe --force
chezmoi add --template /Brewfile
git add Brewfile.tmpl
git commit -m "chore: update Brewfile.tmpl"

