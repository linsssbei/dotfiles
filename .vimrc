set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'chun-yang/auto-pairs'
Plugin 'w0ng/vim-hybrid'
Plugin 'marijnh/tern_for_vim'
call vundle#end()            " required
filetype plugin indent on    " required
syntax on:
set relativenumber
set number 
set autoindent
execute pathogen#infect()
syntax on
" "filetype plugin indent on
set runtimepath^=~/.vim/bundle/ctrlp.vim
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set background=dark
colorscheme hybrid
set noswapfile

let g:syntastic_always_populate_loc_list = 1
let g:ycm_global_ycm_extra_conf = "$HOME/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let NERDTreeShowBookmarks=1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:javascript_plugin_flow = 1
map <C-n> :NERDTreeToggle<CR>
map <C-p> :FZF<CR>
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
set backspace=indent,eol,start
