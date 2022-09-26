#!/bin/bash
set x

cd ~
brew bundle dump --describe --force
chezmoi cd
chezmoi add --template ~/Brewfile
git add Brewfile.tmp
git commit -m "Updated Brewfile"
