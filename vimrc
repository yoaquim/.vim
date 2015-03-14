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

"[MAC]	"map Alt+j, Alt+k to move up/down 10 lines nnoremap ∆ 10j
	nnoremap ∆ 5j
	nnoremap ˚ 5k
	vnoremap ∆ 5j
	vnoremap ˚ 5k

"[MAC]	"map Shift+Alt+j, Shift+Alt+k to move up/down 20 lines
	nnoremap Ô 15j
	nnoremap  15k
	vnoremap Ô 15j
	vnoremap  15k

	"create command 'Q' to quit without saving
	command Q execute "q!"

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

	"map Ctrl+Shift+j/k, to move line/visually-selected-code-blocks up/down
	nnoremap <C-S-j> :m .+1<CR>==
	nnoremap <C-S-k> :m .-2<CR>==
	inoremap <C-S-j> <Esc>:m .+1<CR>==gi
	inoremap <C-S-k> <Esc>:m .-2<CR>==gi
	vnoremap <C-S-j> :m '>+1<CR>gv=gv
	vnoremap <C-S-k> :m '<-2<CR>gv=gv

"===============
"PLUGIN SETTINGS
"===============

	"NerdTree shortcut
	map <silent><leader>d :NERDTreeToggle<CR>


	"Remap CtrlP pluging
	let g:ctrlp_map = '<leader>p'
	let g:ctrlp_cmd = 'CtrlP'

	"Syntastic settings
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 0 
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0

	"Limelight Shortcut
	nnoremap <silent><leader>z :Limeligh!!<cr>

	"Sneak - let <s> jump to next occurence of query
	let g:sneak#s_next = 1

"======================
"COLOR SCHEMES (BASE16)
"======================
"
"***
"The vim colorscheme specified here isn't truly working. The iterm/vim theme is set by changing the bash16-schell script fix, located in .bash_profile.
"Edit the BASE16_SHELL variable in order to change the actual terminal/iterm AND vim colorscheme.
"***
	"access colors present in 256 colorspace (since iTerm is using xterm-256)
	let base16colorspace=256  
	
	"use dark variant, instead of light
	"* doesn't do anything, but here for consistency
	set background=dark

	"base16 color scheme
	"* doesn't really change color, but if not here, messes up colorscheme
	colorscheme base16-default
