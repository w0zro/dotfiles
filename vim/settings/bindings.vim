"
" Bindings
"

"
" Settings
"

" open settings
nmap <leader>,, :e $MYVIMRC<cr>
" reload settings
nmap <leader>,r :so $MYVIMRC<cr>
" reload buffer
nmap <leader>,l :so %<cr>

" jump to general settings
nmap <leader>,g :e $HOME/.vim/settings/general.vim<cr>
" jump to plugins settings
nmap <leader>,p :e $HOME/.vim/settings/plugins.vim<cr>
" jump to appearance settings
nmap <leader>,a :e $HOME/.vim/settings/appearance.vim<cr>
" jump to editing settings
nmap <leader>,e :e $HOME/.vim/settings/editing.vim<cr>
" jump to bindings settings
nmap <leader>,b :e $HOME/.vim/settings/bindings.vim<cr>

"
" Navigation
"

" quick access to files, buffers, and searching
nmap <leader>e :Files<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>f :Ag<cr>
nmap <leader>* :Ag <c-r><c-w><cr>

" toggle between the current buffer and the previous buffer
nmap <leader><leader> :b#<cr>

" make only the current visible
nmap <leader>o :only<cr>

"
" General Text Editing
"

" write, write+quit, and quit
nmap <leader>w :w<cr>
nmap <leader>x :x<cr>
nmap <leader>q :q<cr>

" toggle line numbers
nmap <leader>n :set number!<cr>

" sort visually selected lines
vnoremap <leader>s :sort<cr>

"
" Code Editing
"

" leader access to comment toggle
nmap <leader>c :Commentary<cr>
vmap <leader>c :Commentary<cr>

"
" Running Tests
"
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tt :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

"
" Prompt
"
" <leader>1 is chosen here to mimic my use of 1 as the
" normal mode method of running a shell command
nmap <leader>1 :VimuxPromptCommand<cr>
nmap <leader>11 :VimuxRunLastCommand<cr>
nmap <leader>1q :VimuxCloseRunner<cr>
nmap <leader>1d :VimuxInterruptRunner<cr>

"
" Language Server
"
nmap <leader>ld :LspDefinition<cr>
nmap <leader>lf :LspDocumentFormat<cr>
nmap <leader>lh :LspHover<cr>
nmap <leader>lp :LspPeekDefinition<cr>
nmap <leader>lr :LspRename<cr>
nmap <leader>ls :LspDocumentSymbol<cr>
nmap <leader>lw :LspDocumentDiagnostics<cr>
nmap <leader>li :LspInstallServer<cr>

"
" Advanced
"

" since ; is remapped above, make it available as ;;
noremap ;; ;
" start typing a colon command by pressing ; instead of ⇧;
nmap ; :

" start typing a shell command by pressing 1 instead of press ⇧;1
nmap 1 :!

" move away
nmap <leader>le :call g:DotChangelogEdit()<cr>

" non permanent bindings
so $HOME/.vim/settings/bindings_local.vim
