if &shell =~# 'fish$'
    set shell=sh
endif

syntax enable
filetype plugin indent on

" set spell
set number
set viminfo='20,<1000,s1000
set hlsearch
set ruler
set smartcase
set maxmempattern=10000
set noswapfile
set tabstop=4
set shiftwidth=4
set noexpandtab
set cursorline
set textwidth=100

let g:mapleader="\<space>"
let g:go_fmt_command = "goimports"
" path to directory where library can be found
let g:clang_library_path='/usr/local/Cellar/llvm/7.0.0/lib'

let g:rustfmt_command = "rustup run nightly rustfmt"
let g:rustfmt_autosave = 1

augroup aus
au!
  au BufReadPost *.lalrpop set syntax=rust
  au BufReadPost *.pegjs set syntax=javascript
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup end

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

augroup trailingWhitespace
    autocmd!
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
augroup END
highlight ExtraWhitespace ctermbg=red

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>p "0p
nnoremap <leader>f :Find 
nnoremap <leader>re :e ~/.vimrc<cr>
nnoremap <leader>rr :source ~/.vimrc<cr>

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'dag/vim-fish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
    nnoremap <leader>e :Files<CR>

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" C++
Plug 'Rip-Rip/clang_complete'

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
	    \ 'cpp': ['path', 'keyn', 'dict', 'uspl'],
	    \ 'go': ['path', 'keyn', 'dict', 'uspl'],
		\}

Plug 'vmchale/ion-vim'

Plug 'tpope/vim-fugitive'

Plug 'racer-rust/vim-racer'

Plug 'whatyouhide/vim-gotham'

Plug 'PProvost/vim-ps1'

Plug 'w0rp/ale'

Plug 'davidhalter/jedi-vim'

Plug 'vim-ruby/vim-ruby'

" Initialize plugin system
call plug#end()

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
