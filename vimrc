" colors
syntax enable
set t_Co=256
set t_ut=
syntax on
colorscheme hybrid
set background=dark
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
let g:enable_bold_font = 1
" shift + tab = tab
:inoremap <S-Tab> <C-V><Tab>
" set mouse
set mouse=a
let python_highlight_all = 1
set backspace=indent,eol,start "Backspace key won't move from current line
" vim-airline theme
let g:airline_theme='distinguished'
" move line
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
inoremap <S-j> <Esc>:m .+1<CR>==gi
inoremap <S-k> <Esc>:m .-2<CR>==gi
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv
""""""""""""""""""""""""""""""""""""""""
" vundle
""""""""""""""""""""""""""""""""""""""""
if !filereadable(expand('~/.vim/bundle/Vundle.vim/README.md'))
    echo "Vundle not installed!"
    if confirm("Install Vundle now?", "&Yes\n&No", 1)==1
        silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        silent !vim +PluginInstall +qall
        echo "Vundle Installed"
        silent !vim
        exit
    endif
else
    set nocompatible              " be iMproved, required
    filetype off                  " required
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    call vundle#end()            " required
    filetype plugin indent on    " required
endif
""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""
set completeopt=longest,menu   
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
" 字符開始補全
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
" 註解補全
let g:ycm_complete_in_comments = 1
" 字串補全
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
