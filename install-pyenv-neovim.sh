#!/bin/sh

eval "$(pyenv init --path)"
eval "$(pyenv init -)"

pyenv install 3.8.12
pyenv virtualenv 3.8.12 neovim
pyenv shell neovim
pip install --upgrade pyobjc neovim Send2Trash
