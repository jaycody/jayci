"---------------------------------------------------------------
"   >>>   .vimrc    <<<
"---------------------------------------------------------------
" jstephens
"
" sourced by ~/.vim/vimrc

""thx dougblack.io/words/a-good-vimrc.html
"---------------------------------------------------------------


filetype on
syntax on
colorscheme Tomorrow-Night
"colorscheme badwolf  		    " [1] thx dougblack

set guifont=Menlo\ Regular:h18


set colorcolumn=90

set number


set hidden
set history=100


filetype indent on
set nowrap



set hlsearch


set showmatch


"[1] Spaces, not Tabs {{{
set tabstop=4 		" 4 space tab
set expandtab		" tabs= spaces (<TAB> = 'insert 4 spaces')
set softtabstop=4    	" number of spaces in tab when editing
"}}}







"---------------------------------------------------------------
"   >>>   ref    <<<
"---------------------------------------------------------------

"[1]: dougblack
"	github: dougblack/dotfiles/.vimrc
"	https://dougblack.io/words/a-good-vimrc.html


