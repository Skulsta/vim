" Get vim defaults
source $VIMRUNTIME/defaults.vim

" Get rid of annoying bell sound
set belloff=all

" Hide the swap files from project directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set shiftwidth=4
set softtabstop=4
set expandtab
set number

" Shortcut for getting the current directoy
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'

" Always show at least one line above/below the cursor.
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline
