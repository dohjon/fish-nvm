# TODO

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

## Information

```sh
[nvm][create][success] created folder: /Users/jdoherty/.config/nvm
[nvm][create][success] created folder: /Users/jdoherty/.config/nvm/tmp
[nvm][create][success] created folder: /Users/jdoherty/.config/nvm/versions

nvm --purge
[nvm][path][success] <tmp> folder path: /Users/jdoherty/.config/nvm/tmp
[nvm][path][success] <versions> folder path: /Users/jdoherty/.config/nvm/versions
[nvm][purge][success] purged all data in folder: /Users/jdoherty/.config/nvm/tmp
[nvm][purge][success] purged all data in folder: /Users/jdoherty/.config/nvm/versions
[nvm][unlink][success] removed current <link> from $PATH
```

WILL ADD NODE PATH IN BEGINNING OF PATH

which node
/Users/jdoherty/.nvm/versions/node/v14.17.0/bin/node

## Install

```sh
cd $HOME/.config/fish/functions
```

```sh
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
nvm -h

```

```bash
// Step 2. build
docker build -t calculator:latest .
```

```bash
// Step 3. run

// arguments
docker run \
    --rm \
    -it \
    --workdir /usr/src/app \
    --volume $(pwd):/usr/src/app \
    --init \
    calculator:latest x add 3 print x

// interactive
docker run \
    --rm \
    -it \
    --workdir /usr/src/app \
    --volume $(pwd):/usr/src/app \
    --init \
    calculator:latest

// file
docker run \
    --rm \
    -it \
    --workdir /usr/src/app \
    --volume $(pwd):/usr/src/app \
    --init \
    calculator:latest test.txt
```

```js
// link bin to path
sudo npm link

// or use path
$ lib/calculator.js

// arguments
$ calculator x add 3 print x

// interactive
$ calculator

// file
$ calculator text.txt

```
