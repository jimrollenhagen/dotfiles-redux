:set mouse=a
set background=dark
colorscheme solarized

nnoremap <M-down> <C-w>j
nnoremap <M-up> <C-w>k
nnoremap <M-right> <C-w>l
nnoremap <M-left> <C-w>h

" fix for leaving insert mode taking forever
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set laststatus=2 " Always display the statusline in all windows

"set clipboard=unnamed
set rnu
set colorcolumn=80
