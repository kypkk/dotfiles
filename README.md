# kypkk's dotfiles

These dotfiles are managed using [chezmoi](https://www.chezmoi.io/).


## What I use

| Tools             | Description                                                                                         |
| ----------------- | --------------------------------------------------------------------------------------------------- |
| Terminal emulator | [iTerm2](https://iterm2.com/) |
| Package manager   | [Homebrew](https://brew.sh/)                                                                        |
| Unix shell        | [Z shell](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)                                   |
| Zsh theme         | [Powerlevel10k](https://github.com/romkatv/powerlevel10k)                                           |
| Dotfiles manager  | [chezmoi](https://chezmoi.io/)                                                                      |

## Getting started

Check out the [Quick Start](https://www.chezmoi.io/quick-start/) page.

### Install chezmoi and the dotfiles on any new machine

With a single command:

```sh
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply kypkk
```

### Update

On any machine, you can pull and apply the latest changes from your repo with:

```sh
chezmoi update -v
```

## Features

### Basics
* zsh, [oh-my-zsh](https://github.com/ohmyzsh) and [p10k](https://github.com/romkatv/powerlevel10k)
* vim

### Key Mappings (included in [Terminal.itermkeymap](Terminal.itermkeymap)):

Using Natural Text Editing preset, and the following [Based on BirkhoffLee's keymap setting](https://github.com/BirkhoffLee/dotfiles/blob/master/Terminal.itermkeymap):

| Key     | Send Hex Codes | Description                          |
| ------- | -------------- | ------------------------------------ |
| ⌘Z     | `0x1f`       | undo                                 |
| ⇧⌘Z   | `0x18 0x1f`  | redo                                 |
| ⌥Del→ | `0x17`       | delete word                          |
| ⌘←    | `0x2`        | go to beginning of line              |
| ⇧⌘↵  | `0x1 0x7a`   | maximize pane in current window      |
| ⌃⌘F   | `0x1 0x2b`   | move pane to new window              |
| ⇧⌘D   | `0x1 0x2d`   | splits the current pane vertically   |
| ⌘D     | `0x1 0x5f`   | splits the current pane horizontally |
| ⇧⌘R   | `0x1 0x72`   | reload tmux config                   |
| ⇧⌘←  | `0x1 0x68`   | navigate to the pane on the left     |
| ⇧⌘↓  | `0x1 0x6a`   | navigate to the pane on the bottom   |
| ⇧⌘↑  | `0x1 0x6b`   | navigate to the pane on the top      |
| ⇧⌘→  | `0x1 0x6c`   | navigate to the pane on the right    |
| ⌥⌘←  | `0x1 0x8`    | switch to previous window            |
| ⌥⌘→  | `0x1 0xc`    | switch to next window                |

## Reference

[How To Manage Dotfiles With Chezmoi](https://jerrynsh.com/how-to-manage-dotfiles-with-chezmoi/)

## License

This project is released under [The Unlicense](LICENSE).
