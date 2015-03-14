#Custom Vim Config#

###Intro###

This vim configuartion is based off of amix's [Ultimate vimrc][1].

Used some stuff from [here][23] too.

I mostly customized it for Javascript development.

I use Adobe's free [Source Code Pro][4] font.

You're gonna need [npm][2] (comes bundled with [Node.js][2]) for some plugins.

I use [Homebrew][3]'s vim: 

```Shell
brew install vim
```

Make sure your `usr/local/bin` is before your `usr/bin` in your local `$PATH`:

```Shell
export PATH="/usr/local/bin:$PATH"
echo $PATH
```

###Installation###

To install:

```Shell
git clone https://github.com/yoaquim/.vim.git ~/.vim
```

You're gonna wanna syslink the `vimrc` file to your actual `~/.vimrc`:
			
```Shell
ln -s ~/.vim/vimrc ~/.vimrc
```

Now you need to initialize and update the plugins, which are git submodules:

```Shell
cd ~/.vim
git submodule update --init --recursive
```

If you ever need to update the plugin modules, just do:

```Shell
git submodule foreach git pull origin master
```
###Settings###

* Load plugin files for file types
* Load indent files for file types
* Syntax Highlighting on
* Set `backspace` to act as expected
* Enable mouse (if available)
* Show command status at bottom
* Enable line numbers
* Enable incremental search (search matches as you type)
* Enable Vim ruler (info on current line at bottom of screen) 

###Plugins###

* [Expand Region][5]
* [Airline][6]
* [Fugitive][7]
* [Tern for Vim][10]
* [Limelight][11]
* [Vim Commentary][12]
* [Syntastic][13]
* [Vim Autoclose][14]
* [JSHint][15]
* [Javascript Syntax][16]
* [NERDTree][17]
* [Ctrlp.vim][18]
* [Vim Node][19]
* [Vim Sneak][24]
* [Vim Repeat][25]
* [Vim Surround][26]
* [Split Join][27]
* [YouCompleteMe][28]

####Note on YouCompleteMe####
YouCompleteMe is a very powerful code-completion engine.

Setting it up takes some extra steps ([head to their site][29] for the full instructions):

1. Make sure that your version of Vim is at least 7.3.584 and that it has support for python2 scripting. If you installed homebrew's mavcim version - referenced at the beginning - you're good.
2. Install [cmake][30]. If you have homebrew, you can just do `brew install cmake`.  
3. Compile YCM support libraries:
```
cd ~
mkdir ycm_build
cd ycm_build

cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp

make ycm_support_libs
```
**These steps won't include support for C family languages**.

If you want that, go check out the full instructions.

###Color Schemes###

I'm using base16 color schemes for vim: [base16-vim][20].

I'm also using [iTerm2][21], and so I needed [base16 for iTern2][22].

If you want to use a 256 colorspace, you'll need to add the [base16-shell][31] fix.

With that shell fix, I've only been able to change vim's colorscheme by changing
iTerm's colorscheme **through** [base16-shell's option][32] that lives in your `.bash_profile`.

Still trying to find a workaround for this...

###Some Shortcuts...###

* `:Q` force quits, without saving
* `Alt+j` jumps 5 lines down (same as `5j`)
* `Alt+k` jumps 5 lines up (same as `5k`)
* `Shift+Alt+j` jumps 15 lines down (same as `15j`)
* `Shift+Alt+k` jumps 15 lines up (same as `15k`)
* Spell checking: `\ss`
* Highlight search: `\h\h` first time only; afterwards, toggle by pressing `\h`
* Easier window navigation: `Ctrl+h, Ctrl+j, Ctrl+k, Ctrl+l` for left, down, up & right, respectively
* Wrap selection in brackets, parenthesis, etc. (view vimrc starting at line 68)
* Shortcuts for plugins (view vimrc starting at line 88)

[1]:https://github.com/amix/vimrc
[2]:http://nodejs.org/
[3]:http://brew.sh/
[4]:http://store1.adobe.com/cfusion/store/html/index.cfm?event=displayFontPackage&code=1960
[5]:https://github.com/terryma/vim-expand-region
[6]:https://github.com/bling/vim-airline
[7]:https://github.com/tpope/vim-fugitive
[10]:https://github.com/marijnh/tern_for_vim
[11]:https://github.com/junegunn/limelight.vim
[12]:https://github.com/tpope/vim-commentary
[13]:https://github.com/scrooloose/syntastic
[14]:https://github.com/Townk/vim-autoclose
[15]:https://github.com/walm/jshint.vim
[16]:https://github.com/jelera/vim-javascript-syntax
[17]:https://github.com/scrooloose/nerdtree
[18]:https://github.com/kien/ctrlp.vim
[19]:https://github.com/moll/vim-node
[20]:https://github.com/chriskempson/base16-vim
[21]:http://iterm2.com
[22]:https://github.com/chriskempson/base16-iterm2
[23]:https://github.com/joyent/node/wiki/Vim-Plugins
[24]:https://github.com/justinmk/vim-sneak
[25]:https://github.com/tpope/vim-repeat
[26]:https://github.com/tpope/vim-surround
[27]:https://github.com/AndrewRadev/splitjoin.vim
[28]:https://github.com/Valloric/YouCompleteMe
[29]:https://github.com/Valloric/YouCompleteMe#full-installation-guide
[30]:http://www.cmake.org/download/
[31]:https://github.com/chriskempson/base16-shell
[32]:https://github.com/chriskempson/base16-shell#bashzsh
