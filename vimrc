" Get vim defaults
source $VIMRUNTIME/defaults.vim

" for vim 8
 if (has("termguicolors"))
  set termguicolors
 endif

" colorscheme OceanicNext
autocmd vimenter * colorscheme gruvbox

" Get rid of annoying bell sound
set belloff=all

" Hide the swap files from project directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set number

" Format with prettier/beautify
nnoremap <F5> mzgggqG`z

" Shortcut for getting the current directoy
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'

" Saving and executing python and javascript files
autocmd FileType python map <buffer> <leader>' :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType javascript map <buffer> <leader>' :w<CR>:exec '!node %' shellescape(@%, 1)<CR>

" Indexing files with ctags
nnoremap <leader>t :!ctags -R --exclude=.git --exclude=node_modules --exclude=test<CR>
nnoremap <leader>] :Explore<CR>

" Copy error message to clipboard
nnoremap <leader>e :let @+ = v:statusmsg<CR>

" Used for finding files more easily
set path+=src/**
set path+=public/**
set path=$PWD/**

" Plug for installing Conquer of Completion
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

""""""""""ALE"""""""""" 
" Fix files with prettier, and then ESLint.
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\}

" Fix files automatically on save
let g:ale_fix_on_save = 1

" Navigate to next/previous linting error
nnoremap ]r :ALENextWrap<CR>     " move to the next ALE warning / error
nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error
nnoremap <leader>f :ALEFix<CR>

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
