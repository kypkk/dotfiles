#!/bin/bash
set -x
# rm Brewfile Brewfile.lock.json
cd ~
brew bundle dump --describe --force
chezmoi cd
chezmoi add --template ~/Brewfile
git add Brewfile.tmpl
git commit -m "chore: update Brewfile.tmpl"

