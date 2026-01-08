syntax on
colorscheme desert

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set number
set ruler
set hlsearch
set smartindent
set encoding=utf-8
set pastetoggle=<F9>

"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"set backspace=indent,eol,start

au BufRead,BufNewFile /etc/nginx/*,*/conf/nginx.conf,*/nginx/conf.d/*.conf,*/conf/vhosts/*.conf setfiletype nginx
autocmd FileType coffee,html,css,xml,yaml,json set sw=2 ts=2

