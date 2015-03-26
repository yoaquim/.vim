#Custom Vim Config#
###Intro###

This vim configuartion is based off of amix's [Ultimate vimrc][1].

Used some stuff from [here][23] too.

You should read through this entire doc in order to successfully set up this vim conf.

I mostly customized it for Javascript development.

I use Adobe's free [Source Code Pro][4] font.

You're gonna need [npm][2] (comes bundled with [Node.js][2]) for some plugins.

And I seriously recommend getting [Homebrew][3], if you haven't already - makes all the extra steps, and installing in general, super easy.

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
You should also do this each time you clone any repo that has submodules, or whenever you add a submodule.

If you ever need to update the plugin modules, just do:

```Shell
git submodule foreach git pull origin master
```
To finish setting everything up:
 - [Finish installing JSHint2](#note-on-jshint2)
 - [Finish installing Vim-LESS](#note-on-vim-less)
 - [Finish installing Taglist](#note-on-taglist)
 - [Finish installing YouCompleteMe](#note-on-youcompleteme)
 - [Set up Color Schemes](#color-schemes)

###Settings###

* Load plugin files for file types
* Load indent files for file types
* Syntax Highlighting on
* Set `updatetime` to 1000 milliseconds
* Set `backspace` to act as expected
* Enable mouse (if available)
* Show command status at bottom
* Enable line numbers
* Enable incremental search (search matches as you type)

###Plugins###

* [Airline][6]
* [Tern for Vim][10]
* [Limelight][11]
* [Vim Commentary][12]
* [Syntastic][13]
* [Vim Autoclose][14]
* [Vim JSHint2][15]
* [Javascript Syntax][16]
* [Vim-CSS3-Syntax](https://github.com/hail2u/vim-css3-syntax)
* [Vim-LESS](https://github.com/groenewege/vim-less)
* [NERDTree][17]
* [Ctrlp.vim][18]
* [Vim Node][19]
* [Vim Fugitive](https://github.com/tpope/vim-fugitive)
* [Vim Gitgutter][5]
* [Vim Sneak][24]
* [Vim Repeat][25]
* [Vim Surround][26]
* [Split Join][27]
* [Taglist][7]
* [YouCompleteMe][28]

####Note on JSHint2####
You need [JSHint](http://jshint.com/) in order for the plugin to work.

You can install it via npm: `sudo npm install -g jshint`.

####Note on Vim-LESS####
For compiling from less to css, you'll need [lessc](http://lesscss.org/#using-less-installation):

```
npm install -g less
```

That also doubles as a [Syntastic checker](https://github.com/scrooloose/syntastic/wiki/LESS%3A---lessc).

####Note on Taglist####
Taglist allows you to view source docs for whatever file your working with, and works just like
Vim's tags/helptags.

It needs [Exuberant Ctags][8] to work, but hombrew makes that easy: `brew install ctags-exuberant`.

After that, navigate to your .vim dir, open vim and run the helptags command for the current dir: `:helptags .`.

You can then run `:TlistToggle` to show the source doc window, or just do `\tt`, a custom mapping I have for that command.

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

#####Tern Support#####

[YouCompleteMe][28] doesn't come with support for Javascript out of the box - it does scan the current file for things you've typed, but no pure JS support.

Luckily, [Tern][10] provides an omni-completion function that YCM can hook into; this offers really good, native Javascript completion.

###Color Schemes###

I'm using base16 color schemes for vim: [base16-vim][20].

I'm also using [iTerm2][21], and so I needed [base16 for iTern2][22].

If you want to use a 256 colorspace, you'll need to add the [base16-shell][31] fix.

Since console Vim can only access colorschemes available to the console/iTerm2, you have to change
the console's/iTerm's colorscheme via [base16-shell's option][32] that lives in your `.bash_profile`,
in order to change Vim's colorscheme:

```
BASE16_SHELL="$HOME/.config/base16-shell/*CHOOSE_COLOR_SCHEME*.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL ]]
```

So if you want the dark base16-ocean theme for example, you'd do `.../base16-shell/base16-ocean.dark.sh...`.

Again, **this will change your console/iTerm colorscheme also**.

###Some shortcuts...###

* Quickly type `jk` to go to Normal Mode - mapped to `Esc`('jk' is a rare diagraph in English and you can always wait between typing both chars if you ever need to insert them)

* `:W` saves current file as sudo (for when you open a file having no write permissions)

* `:Q` force quits, without saving

* `Alt+j` jumps 5 lines down (same as `5j`)

* `Alt+k` jumps 5 lines up (same as `5k`)

* `Shift+Alt+j` jumps 15 lines down (same as `15j`)

* `Shift+Alt+k` jumps 15 lines up (same as `15k`)

* `Alt+Shift+.` moves the current line up (can also be used in visual mode when selecting blocks/paragraphs)

* `Alt+Shift+,` moves the current line down (can also be used in visual mode when selecting blocks/paragraphs)

* Spell checking: `\ss`

* Highlight search: `\h\h` first time you open a file; afterwards, toggle by pressing `\h`

* Easier window navigation: `Ctrl+h`, `Ctrl+j`,`Ctrl+k`, `Ctrl+l` for left, down, up & right, respectively

* Wrap selection in brackets, parenthesis, etc. (view vimrc starting at line 68)

* Shortcuts for plugins (view vimrc starting at line 88)

[1]:https://github.com/amix/vimrc
[2]:http://nodejs.org/
[3]:http://brew.sh/
[4]:http://store1.adobe.com/cfusion/store/html/index.cfm?event=displayFontPackage&code=1960
[5]:https://github.com/airblade/vim-gitgutter
[6]:https://github.com/bling/vim-airline
[7]:https://github.com/vim-scripts/taglist.vim
[8]:http://ctags.sourceforge.net/
[10]:https://github.com/marijnh/tern_for_vim
[11]:https://github.com/junegunn/limelight.vim
[12]:https://github.com/tpope/vim-commentary
[13]:https://github.com/scrooloose/syntastic
[14]:https://github.com/Townk/vim-autoclose
[15]:https://github.com/Shutnik/jshint2.vim
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
