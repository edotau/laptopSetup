syntax enable
colorscheme monokai
set tabstop=4
set expandtab
if has(".go")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/template.go
  augroup END
endif
