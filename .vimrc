if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
call plug#end()

let g:airline#extensions#tabline#enabled = 1

let php_sql_query = 1
let php_htmlInStrings = 1

syntax on

filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set ignorecase
set noshowmode

augroup phils_vim
    autocmd!
    autocmd BufWritePost * :call TrimTrailingWhitespace()
augroup END

function! TrimTrailingWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfunction
