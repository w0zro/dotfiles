"
" Plugin management using vim-plug
"

" Install vim-plug if it is not installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | so $MYVIMRC
endif

"
" Plugins list
"

call plug#begin()
Plug 'tpope/vim-sensible'                        " common defaults
Plug 'junegunn/fzf',                             " fuzzy finding
            \ { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'reedes/vim-wheel'                          " in-place cursor scroll
Plug 'tpope/vim-commentary'                      " code comments
Plug 'chriskempson/base16-vim'                   " themes
Plug 'sheerun/vim-polyglot'                      " variety language pack
"
" additional filetype support
"
Plug 'bfontaine/Brewfile.vim'                    " homebrew
"
" language server
"
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
call plug#end()

"
" Plugin configurations
"

"
" FZF
"

" use silver searcher for things like gitignore exclusions
" https://github.com/junegunn/fzf.vim/issues/121#issuecomment-209534405
let $FZF_DEFAULT_COMMAND='ag -g ""'

" use ctrl-s for split as it's less awkward to strike
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit' }
