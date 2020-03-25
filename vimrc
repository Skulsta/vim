" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
" For activating netrw
filetype plugin on

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Quick way to change vimrc
let mapleader = ","
map <leader>vimrc :tabe ~/.vim/vimrc<cr>
autocmd bufwritepost vimrc source ~/.vim/vimrc

" For ragtag, might not be needed
let g:ragtag_global_maps = 1

" Faster save
noremap <Leader>l :update<CR>

" Save and run python file
autocmd FileType python map <buffer> <leader>l :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Get rid of annoying bell sound
set belloff=all

" Hide the swap files from project directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set number

" Tabs and spaces
set shiftwidth=4
set softtabstop=4
set expandtab

" Increase the commads history from 20
set history=200

" Shortcut for getting the current directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
