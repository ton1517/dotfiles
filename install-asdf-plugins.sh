#!/usr/bin/env bash

asdf plugin-add direnv https://github.com/asdf-community/asdf-direnv
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add python https://github.com/asdf-community/asdf-python
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git

asdf install
