"=========================
" VIM SETTINGS & SHORTCUTS
"=========================

	"Pathogen
		"pathogen package manager
		execute pathogen#infect()
		"generate helptags for all plugins
		execute pathogen#helptags()

	"loads plugin files and indent files for file types
	filetype plugin indent on

	"syntax highlighting on
	syntax on

	"change Vim's updatetime setting (mostly for vim-gitgutter plugin)
	set updatetime=1000

	"if a mouse is present, enable it
	if has('mouse')
		set mouse=a
	endif

	"set backspace to work as expected
	set backspace=indent,eol,start

	"show command status
	set showcmd

	"show line numbers
	set nu

	"make search incremental
	set incsearch

	"change tab settings to insert 4 spaces
	set softtabstop=4
	set shiftwidth=4
	set expandtab

	"Folding
		"define custom folding function (taken from: http://vim.wikia.com/wiki/Customize_text_for_closed_folds)
		function! CustomFold()
			let line = getline(v:foldstart)
			if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
				let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
				let linenum = v:foldstart + 1
				while linenum < v:foldend
					let line = getline( linenum )
					let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
					if comment_content != ''
						break
					endif
					let linenum = linenum + 1
				endwhile
				let sub = initial . ' ' . comment_content
			else
				let sub = line
				let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
				if startbrace == '{'
					let line = getline(v:foldend)
					let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
					if endbrace == '}'
						let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
					endif
				endif
			endif
			let n = v:foldend - v:foldstart + 1
			let info = " " . n . " lines"
			let sub = sub . " >>>"
			let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
			let fold_w = getwinvar( 0, '&foldcolumn' )
			let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
			return sub . info
		endfunction

		"set fold method to custom function
		set foldtext=CustomFold()

		"press space to toggle folding; if no fold, default behavior
		nnoremap <silent>\\ @=(foldlevel('.')?'za':"\<Space>")<CR>
		vnoremap \\ zf

        "set <Space> as Leader key
        let mapleader = "\<Space>"

        "save file (alias of :w<Enter>), also alias to W command
        nnoremap <Leader>w :w<CR>
        nnoremap <Leader>W :W<CR>

        "quit file (alias of :q<Enter>), also alias to Q command
        nnoremap <Leader>q :q<CR>
        nnoremap <Leader>Q :Q<CR>
        
        "save & quit file (alias of :x<Enter>), also alias to X command
        nnoremap <Leader>x :x<CR>
        nnoremap <Leader>X :X<CR>

       "map Alt+j, Alt+k to move up/down 10 lines nnoremap ∆ 10j
	nnoremap ∆ 5j
	nnoremap ˚ 5k
	vnoremap ∆ 5j
	vnoremap ˚ 5k

       "map Shift+Alt+j, Shift+Alt+k to move up/down 20 lines
	nnoremap Ô 15j
	nnoremap  15k
	vnoremap Ô 15j
	vnoremap  15k

	"create command 'Q' to quit without saving
	command Q execute "q!"

	"create command 'W' to save file as sudo; need to press Enter twice
	command W execute "w !sudo tee % >/dev/null"

	"close preview windows
	inoremap <silent><Leader>xp :pc <CR>
	nnoremap <silent><Leader>xp :pc <CR>
	vnoremap <silent><Leader>xp :pc <CR>

	"close location list
	inoremap <silent><Leader>xl :lclose <CR>
	nnoremap <silent><Leader>xl :lclose <CR>
	vnoremap <silent><Leader>xl :lclose <CR>

	"set '\h' to toggle search highlight
	let hlstate=0
	nnoremap <silent><Leader>h :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>

	"move between windows easily
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

	"toggle spell checking
	map \s :setlocal spell!<cr>

	"surround visual selection with brackets, parenthesis, etc.
	vnoremap $1 <esc>`>a)<esc>`<i(<esc>
	vnoremap $2 <esc>`>a]<esc>`<i[<esc>
	vnoremap $3 <esc>`>a}<esc>`<i{<esc>
	vnoremap $$ <esc>`>a"<esc>`<i"<esc>
	vnoremap $q <esc>`>a'<esc>`<i'<esc>
	vnoremap $e <esc>`>a"<esc>`<i"<esc>

"[]    "map <Alt+Shift+,> and <Alt+Shift+.>, to move line/visually-selected-code-blocks up and down
	nnoremap ¯ :m .+1<CR>==
	nnoremap ˘ :m .-2<CR>==
	inoremap ¯ <Esc>:m .+1<CR>==gi
	inoremap ˘ <Esc>:m .-2<CR>==gi
	vnoremap ¯ :m '>+1<CR>gv=gv
	vnoremap ˘ :m '<-2<CR>gv=gv

        "map Shift+Tab to go to previous file (Ctrl-O default)
        nmap <S-Tab> <C-O>

        "copy & paste to system clipboard with <Space>p and <Space>y
        vmap <Leader>y "+y
        vmap <Leader>d "+d
        nmap <Leader>p "+p
        nmap <Leader>P "+P
        vmap <Leader>p "+p
        vmap <Leader>P "+P

        "enter visual line mode with <Space><Space>
        nmap <Leader><Leader> V

"============================
" PLUGIN SETTINGS & SHORTCUTS
"============================

        "Vim-Expand-Region keymappings to selecte incrementing regions with
        "each `v` press; undo with Ctrl+v
        vmap v <Plug>(expand_region_expand)
        vmap <C-v> <Plug>(expand_region_shrink)

        "Javascript highlighting:enables HTML/CSS highlighting in javascript
        let g:javascript_enable_domhtmlcss=1

        "delimitMate settings to insert linebreak on brackets
        let g:delimitMate_expand_cr=1

	"NerdTree shortcut
	map <silent><Leader>f :NERDTreeToggle<CR>

        "Vim Airline settings
        set laststatus=2

        "Ag settings
            " Highlight search term
            let g:ag_highlight=1

        "Let CtrlP use git for searching inside Git projects
        let g:ctrlp_use_caching = 0
        if executable('ag')
            set grepprg=ag\ --nogroup\ --nocolor

            let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        else
            let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
            let g:ctrlp_prompt_mappings = {
                        \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
                        \ }
        endif

	"Limelight Shortcut
	nnoremap <silent><Leader>z :Limeligh!!<cr>

        "Indent-Guide Settings for odd/even indent colors
        let g:indent_guides_auto_colors = 0
        let g:indent_guides_start_level=2
        let g:indent_guides_guide_size=1
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=NONE
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=18

	"Sneak - let <s> jump to next occurence of query
	let g:sneak#s_next = 1

	"Toggle source doc window (taglist.vim plugin)
	nnoremap <silent><Leader>tt :TlistToggle<CR>

	"Syntastic settings
                "let syntastic ignore missing 'use strict' error, require not defined and module not defined warnings
                let g:syntastic_javascript_jshint_quiet_messages = { 'regex': [ '\VMissing "use strict" statement.',    "'module' is not defined.",     "'require' is not defined.",    "'__dirname' is not defined."]}

		"prevent syntastic from populating the loc list with each error it finds
		let g:syntastic_always_populate_loc_list = 1

		"dont let location list open up automatically
		let g:syntastic_auto_loc_list = 0

		"let syntastic check for errors when opening
		let g:syntastic_check_on_open = 1

		"don't let syntastic check for errors when exiting (takes too long)
		let g:syntastic_check_on_wq = 1

		"change syntastic's default error symbol (unicode)
		let g:syntastic_error_symbol = "✖"

		"change error symbol color to match DiffDelete highlight group
		highlight link SyntasticErrorSign DiffDelete

		"change error line highlight color to match Error highlight group
		highlight link SyntasticErrorLine Error

		"change syntastic's default warning symbol (unicode)
		let g:syntastic_warning_symbol = "⚑"

	"Tern Settings
		"map TernRename to '\re\'
		nnoremap <silent><Leader>re :TernRename<CR>

		"map TernRef to '\rf\'
		nnoremap <silent><Leader>rf :TernRef<CR>

		"map TernDef to '\df\'
		nnoremap <silent><Leader>df :TernDef<CR>

		"map TernDoc to '\dc\'
		nnoremap <silent><Leader>dc :TernDoc<CR>

		"map TernType to '\ty\'
		nnoremap <silent><Leader>ty :TernType<CR>

	"Gitgutter Settings
		"toggle highlighting for Gitgutter
		nmap <silent><Leader>gh :GitGutterLineHighlightsToggle<CR>

		"move to next hunk
		nmap ]h <Plug>GitGutterNextHunk

		"move to previous hunk
		nmap [h <Plug>GitGutterPrevHunk

		"stage current hunk
		nmap <Leader>ha <Plug>GitGutterStageHunk

		"unstage current hunk
		nmap <Leader>hu <Plug>GitGutterRevertHunk

"=======================
" COLOR SCHEMES 
"=======================

	"access colors present in 256 colorspace for base16 (since iTerm is using xterm-256)
	let base16colorspace=256

        "set colorscheme to be base16 default in order to apply base16 colors from terminal
        colorscheme base16-default-dark
        if filereadable(expand("~/.vimrc_background"))
            source ~/.vimrc_background
        endif

"**********************
" SPECIAL MAP
"**********************

	"placed at bottom so no comments will be interpreted after <Esc>
	"remaps <Esc> key to jk (need to be typed quickly)
	inoremap jk <Esc>
