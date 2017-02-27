" colors
syntax enable
set t_Co=256
syntax on
" tab
set tabstop=4
set shiftwidth=4
set noexpandtab
set expandtab
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" cursorline
set cursorline
hi cursorline cterm=none term=none
" highlight CursorLine guibg=#303000 ctermbg=008
set showmode
set number
set ai
set ruler
" shift + tab = tab
:inoremap <S-Tab> <C-V><Tab>
" set mouse
set mouse=a
let python_highlight_all = 1
set backspace=indent,eol,start "Backspace key won't move from current line

" vundle start
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required
filetype plugin indent on    " required
" vundle end

" vim-airline
set laststatus=2
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='distinguished'
