# development_environment_setup

The purpose of this repository is to offer reusable scripts and files to automate the setup of my development environment.

This includes:

* Installing debian packages
* Setting up zsh and oh-my-zsh
* Setting up vim
* Setting up tmux

## How to run

* Modify `my_debian_dependencies.txt` to be a list of debian packages to be installed
* Add any extra setup commands to the bottom of `setup.bash` that you may find useful
* Then run the following once (only needs to be run once)

```
./setup.bash
```
