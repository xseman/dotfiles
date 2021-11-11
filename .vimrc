" more risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

" highlight search hits
set hlsearch
set incsearch
set linebreak

" avoid most of the 'Hit Enter ...' messages
set shortmess=aoOtTI

" not a fan of bracket matching or folding
let g:loaded_matchparen=1
set noshowmatch

" wrap around when searching
set wrapscan

" here because plugins and stuff need it
syntax enable

" not a fan of bracket matching or folding
let g:loaded_matchparen=1

" stop complaints about switching buffer with changes
set hidden

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

set clipboard=unnamed
set number
set ruler

set colorcolumn=80,80
set expandtab ts=4 sw=4 ai

:nnoremap j k
:nnoremap k j

highlight ColorColumn ctermbg=grey

" only load plugins if Plug detected
" github.com/junegunn/vim-plug

if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.local/share/vim/plugins')
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'sheerun/vim-polyglot'
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'tpope/vim-fugitive'
    call plug#end()
else
    autocmd vimleavepre *.go !gofmt -w % " backup if fatih fails
endif
