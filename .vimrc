syntax on
filetype plugin indent on

" set nocompatible
set number " show line numbers
set showcmd " show last command in bottom right
set cursorline " highlight current line
set lazyredraw " redraw only when we need to.
set showmatch " highlight matching [{()}]
" set nowrap
" set showmode
" set tw=80
" set smartcase
" set smarttab
" set smartindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
autocmd BufRead,BufNewFile *.fs,*.fsx set expandtab

set incsearch " search as characters are entered
set hlsearch " highlight matches
set mouse=a
set history=1000
set clipboard=unnamedplus,autoselect
set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu " visual autocomplete for command menu
set completeopt+=longest

set t_Co=256
if (has("termguicolors"))
	set termguicolors
endif

set cmdheight=1

colorscheme moriarty 

" -- Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1 
let g:syntastic_javascript_checkers = ['eslint']


" -- Elm
let g:elm_syntastic_show_warnings = 1
let g:elm_format_autosave = 1
