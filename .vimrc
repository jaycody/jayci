"---------------------------------------------------------------
"   >>>   .vimrc    <<<
"---------------------------------------------------------------
" jstephens
"
" sourced by ~/.vim/vimrc

""thx dougblack.io/words/a-good-vimrc.html
"---------------------------------------------------------------




"---------------------------------------------------------------
"   >>>  Admin   <<<
"---------------------------------------------------------------
filetype on                     " ?
syntax on                       " ?
filetype indent on              " load file-type specific indent files
set hidden
set history=100



"---------------------------------------------------------------
"   >>>  Format [1]   <<<
"---------------------------------------------------------------
set guifont=Menlo\ Regular:h18
colorscheme Tomorrow-Night
"colorscheme badwolf            " [1] thx dougblack



"---------------------------------------------------------------
"   >>>  Spaces, not Tabs [1]   <<< 
"---------------------------------------------------------------
set tabstop=4           		" 4 space tab
set expandtab	            	" tabs= spaces (<TAB> = 'insert 4 spaces')
set softtabstop=4           	" number of spaces in tab when editing
set nowrap                      " aint no wrap around



"---------------------------------------------------------------
"   >>>  UI Config [1]   <<<
"---------------------------------------------------------------
set number                      " show line number
set showcmd                     " show command in bottom bar
set cursorline                  " highlight current line
set colorcolumn=90              " show me the vertical
set showmatch                   " hightlight matching [{()}]
set wildmenu                    " visual autocomplete for command menu
                                "   eg. run :e ~/.vim<TAB>



"---------------------------------------------------------------
"   >>>  Search [1]   <<<
"---------------------------------------------------------------
set incsearch                   " search as chars are entered
set hlsearch                    " highlight matches



"---------------------------------------------------------------
"   >>>  Folding [1]   <<<
"---------------------------------------------------------------
set foldmethod=indent           " fold based on indent levels
set foldenable                  " don't fold by default on open
set foldlevelstart=10           " open most folds by default
set foldnestmax=10              " 10 nested folds - max
nnoremap <space> za             " remap <space> to open/close



"---------------------------------------------------------------
"   >>>   ref    <<<
"---------------------------------------------------------------

"[1]: dougblack
"	github: dougblack/dotfiles/.vimrc
"	https://dougblack.io/words/a-good-vimrc.html



"---------------------------------------------------------------
"   >>>   Modelines    <<<   (file-specific overrides)
"--------------------------------------------------------------
set modelines=1

" for .vimrc --> fold at '{' x3 and start folds closed
" vim:foldmethod=marker:foldlevel=0
