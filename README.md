# nvm.fish

> **Minimal** nodejs version manager made for [Fish](https://fishshell.com).

- Minimal (new install will overwrite previous install)
- Install (from [mirror](https://nodejs.org/dist))
- Remove
- Uses [XDG Base Directory](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)

## About

Only tested on Mac but tweaking **uname** flags should make it work out of the box with linux)

See below for recommended, maintained and more robust options:

- [https://github.com/jorgebucaran/nvm.fish](https://github.com/jorgebucaran/nvm.fish)
- [https://github.com/FabioAntunes/fish-nvm](https://github.com/FabioAntunes/fish-nvm)

## Requirements

fish

```sh
$ fish --version
fish, version 3.3.1
```

sha256sum

```sh
$ sha256sum --version
sha256sum (GNU coreutils) 9.0
```

fzf

```sh
$ fzf --version
0.27.2
```

## Install

```sh
cd $HOME/.config/fish/functions
git clone https://github.com/dohjon/fish-node-manager.git
```

```sh
echo 'set fish_function_path $HOME/.config/fish/functions/nvm $fish_function_path' >> $HOME/.config/fish/config.fish
```

```sh
# verify installation
nvm -h
```

## Usage

```sh
# nvm -i
nvm --install
```

```sh
# nvm -p
nvm --purge
```

```sh
# nvm -h
nvm --help
```
