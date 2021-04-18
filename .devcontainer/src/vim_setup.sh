#!/usr/bin/env bash

# Make sure you're in your home directory.
cd ${HOME}

# Make a Vim config directory.
mkdir -p ${HOME}/.vim/pack

# Asyncronous Linting Engine
git clone https://github.com/dense-analysis/ale.git ${HOME}/.vim/pack/dense-analysis/start/ale

# CtrlP Fuzzy Search
git clone https://github.com/ctrlpvim/ctrlp.vim.git ${HOME}/.vim/pack/ctrlpvim/start/ctrlp.vim

# FZF Fuzzy Finder
# You'll need to install fzf on your system as well.
git clone https://github.com/junegunn/fzf.vim.git ${HOME}/.vim/pack/junegunn/start/fzf.vim

# OmniSharp, used for C# "Intellisense"
git clone https://github.com/OmniSharp/omnisharp-vim.git ${HOME}/.vim/pack/omnisharp/start/omnisharp-vim

# Rust Lang bindings and highlighting.
git clone https://github.com/rust-lang/rust.vim.git ${HOME}/.vim/pack/rust-lang/start/rust.vim

# Sets up the bottom info line for Vim
git clone https://github.com/vim-airline/vim-airline.git ${HOME}/.vim/pack/vim-airline/start/vim-airline

# My favorite colorscheme.
git clone https://github.com/ajmwagar/vim-deus.git ${HOME}/.vim/pack/ajmwagar/start/vim-deus

# Auto-closing for certain things.
git clone https://github.com/tpope/vim-endwise.git ${HOME}/.vim/pack/tpope/start/vim-endwise

# A Git client for Vim.
git clone https://github.com/tpope/vim-fugitive.git ${HOME}/.vim/pack/tpope/start/vim-fugitive

# Markdown for Vim.
git clone https://github.com/tpope/vim-markdown.git ${HOME}/.vim/pack/tpope/start/vim-markdown

# Go bindings and highlighting.
git clone https://github.com/fatih/vim-go.git ${HOME}/.vim/pack/fatih/start/vim-go

# Automatically run ctags -R .
git clone https://github.com/ludovicchabant/vim-gutentags.git ${HOME}/.vim/pack/ludovicchabant/start/vim-gutentags

# Generate Table of Contents for Markdown documents.
git clone https://github.com/mzlogin/vim-markdown-toc.git ${HOME}/.vim/pack/mzlogin/start/vim-markdown-toc

# A set of language highlighting packs.
git clone https://github.com/sheerun/vim-polyglot.git ${HOME}/.vim/pack/sheerun/opt/vim-polyglot

# Terraform bindings and highlighting.
git clone https://github.com/hashivim/vim-terraform.git ${HOME}/.vim/pack/hashivim/start/vim-terraform

# Slide Show Presentations in Vim.
git clone https://github.com/sotte/presenting.vim.git ${HOME}/.vim/pack/sotte/start/presenting.vim

# Distraction free editing in Vim
git clone https://github.com/junegunn/goyo.vim.git ${HOME}/.vim/pack/junegunn/start/goyo.vim

# Commander Of Completion, for (n)vim
git clone https://github.com/neoclide/coc.nvim.git ${HOME}/.vim/pack/neoclide/start/coc.nvim

# Docker and Dockerfiles
git clone https://github.com/ekalinin/dockerfile.vim.git ${HOME}/.vim/pack/ekalinin/start/dockerfile.vim

# Setting up coc.nvim
# Install extensions
mkdir -p ${HOME}/.config/coc/extensions
cd ${HOME}/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
# Change extension names to the extensions you need
npm install \
  --global-style \
  --ignore-scripts \
  --no-bin-links \
  --no-package-lock \
  --only=prod \
    coc-json \
    coc-yaml \
    coc-sh \
    coc-rls \
    coc-python \
    coc-markdownlint \
    coc-eslint \
    coc-css \
    coc-tsserver
# The coc-rls will require that the rustup component rust-rls be installed.
# The coc-json coc-yaml will need to have Python's yamllint and jsonlint installed.
