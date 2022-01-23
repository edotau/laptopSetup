syntax enable
colorscheme monokai
set tabstop=4
set expandtab
autocmd BufNewFile *.go 0r ~/.vim/templates/template.go
autocmd BufNewFile *.py 0r ~/.vim/templates/template.py
autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh
