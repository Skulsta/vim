" Get vim defaults
source $VIMRUNTIME/defaults.vim

" Color options
" Important!!
if has('termguicolors')
  set termguicolors
endif

" Get rid of annoying bell sound
set belloff=all

" Hide the swap files from project directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set tabstop=2
set shiftwidth=2
set expandtab
set number
set autoread

" Saving and executing python and javascript files
autocmd FileType python map <buffer> <leader>' :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType javascript map <buffer> <leader>' :w<CR>:exec '!node %' shellescape(@%, 1)<CR>

" Indexing files with ctags
nnoremap <leader>t :!ctags -R --exclude=.git --exclude=node_modules --exclude=test<CR>

" Shortcuts
nnoremap <leader>] :Explore<CR>
nnoremap <leader>g :Ag 
inoremap aa å

"Switch between different windows by their direction`
no <C-j> <C-w>j| "switching to below window
no <C-k> <C-w>k| "switching to above window
no <C-l> <C-w>l| "switching to right window
no <C-h> <C-w>h| "switching to left window

"Yank to Mac clipboard
set clipboard=unnamed

" Used for finding files more easily
set path+=src/**
set path+=public/**
set path=$PWD/**

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'sainnhe/gruvbox-material'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'dense-analysis/ale'

Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-scripts/loremipsum'

Plug 'cakebaker/scss-syntax.vim'

" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sbdchd/neoformat'

Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

colorscheme gruvbox-material

""""""""""ALE"""""""""" 
let g:ale_fixers = ['prettier', 'eslint']
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
