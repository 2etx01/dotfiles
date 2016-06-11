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
highlight CursorLine guibg=#303000 ctermbg=008
set showmode
set number
set ai
set ruler
" shift + tab = tab
:inoremap <S-Tab> <C-V><Tab>
" set mouse
set mouse=a
let python_highlight_all = 1

