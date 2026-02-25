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

set termguicolors
" when entering REPLACE mode
let &t_SR = "\e[4 q"
" when entering INSERT mode
let &t_SI = "\e[6 q"
" when entering NORMAL mode
let &t_EI = "\e[2 q"
" when entering vim
let &t_ti ..= "\e[2 q"
" when leaving vim
let &t_te ..= "\e[5 q"

au BufRead,BufNewFile /etc/nginx/*,*/conf/nginx.conf,*/nginx/conf.d/*.conf,*/conf/vhosts/*.conf setfiletype nginx
autocmd FileType coffee,html,css,xml,yaml,json set sw=2 ts=2
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

