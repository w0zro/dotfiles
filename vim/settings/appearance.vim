"
" Appearance
"

" use shell theme, if present
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    so ~/.vimrc_background
endif
