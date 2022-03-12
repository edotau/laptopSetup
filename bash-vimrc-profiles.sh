#!/bin/bash
set -e

rm -rf ~/.vim && cp -r .vim ~/.vim/

touch ~/.vimrc && rm ~/.vimrc

echo "syntax enable
colorscheme monokai
set tabstop=4
set shiftwidth=4
set autoindent
noremap p gp
noremap P gP
noremap gp p
noremap gP P

autocmd BufNewFile *.go 0r ~/.vim/templates/template.go
autocmd BufNewFile *.py 0r ~/.vim/templates/template.py
autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh
"

cp .vimrc ~/.vimrc

