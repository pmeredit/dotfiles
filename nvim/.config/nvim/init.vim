syntax on

set number
set viminfo='20,<1000,s1000
set hlsearch
set ruler
set smartcase
set inccommand=nosplit
set maxmempattern=10000

au BufReadPost *.lalrpop set syntax=rust
au BufReadPost *.pegjs set syntax=javascript

au BufWritePost * %s/\([.!?]\)\s\+/\1 /g

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

Plug 'rust-lang/rust.vim'

Plug 'lifepillar/vim-mucomplete'
	set completeopt=menuone,noselect
	let g:mucomplete#enable_auto_at_startup = 1
	let g:mucomplete#chains = { 
		\ 'default': ['path', 'omni', 'keyn', 'dict', 'uspl'],
		\ 'sql': ['path', 'keyn', 'dict', 'uspl'],
		\ 'python': ['path', 'keyn', 'dict', 'uspl'],
		\ 'js': ['path', 'keyn', 'dict', 'uspl'],
		\}

Plug 'tpope/vim-fugitive'

Plug 'racer-rust/vim-racer'

Plug 'whatyouhide/vim-gotham'

" Initialize plugin system
call plug#end()
