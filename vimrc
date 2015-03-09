"============
"VIM SETTINGS
"============

	"pathogen package manager
	execute pathogen#infect()

	"loads plugin files and indent files for file types
	filetype plugin indent on

	"syntax highlighting on
	syntax on

	"set fold method (code block collapse) to syntax (language specific)
	set foldmethod=manual
	"press space to toggle foldingl if no fold, default behavior
	nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
	vnoremap <Space> zf

"[OFF]	"set vim-javascript-syntax plugin folding (foldmethod must be set to syntax) 
	"au FileType javascript call JavaScriptFold()

	"enable mouse
	if has('mouse')
		set mouse=a
	endif

	"set backspace to work all-around
	set backspace=indent,eol,start

	"show command status
	set showcmd
	
	"set line numbers
	set nu

	"set ruler
	set ruler

	"set incremental search
	set incsearch

	"set '\h' to toggle search highlight
	let hlstate=0
	nnoremap <leader>h :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>

	"move between windows easily
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

	"toggle spell checking
	map <leader>ss :setlocal spell!<cr>

	"surround visual selection with brackets, parenthesis, etc.
	vnoremap $1 <esc>`>a)<esc>`<i(<esc>
	vnoremap $2 <esc>`>a]<esc>`<i[<esc>
	vnoremap $3 <esc>`>a}<esc>`<i{<esc>
	vnoremap $$ <esc>`>a"<esc>`<i"<esc>
	vnoremap $q <esc>`>a'<esc>`<i'<esc>
	vnoremap $e <esc>`>a"<esc>`<i"<esc>

"===============
"PLUGIN SETTINGS
"===============

	"NerdTree shortcut
	map <silent><leader>d :NERDTreeToggle<CR>

	"Syntastic settings
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 0 
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0

	"Goyo/Vim-Zenroom2 Shortcut
	nnoremap <silent> <leader>zz :Goyo<cr>

	"Limelight Shortcut
	nnoremap <silent><leader>z :Limeligh!!<cr>


"============
"COLOR SCHEMES
"============

	"MONOKAI
	"-------------
	colorscheme monokai

"[OFF]	"MANGO 
	"------------
	"set background=dark   
	"colorscheme mango

"[OFF]	"SOLARIZED 
	"---------
	" set background=dark
	" let g:solarized_termcolors=256
	" colorscheme solarized
