#Custom Vim Config#

###Intro###

This vim configuartion is based off of amix's [Ultimate vimrc][1].

Used some stuff from [here][90] too.

I mostly customized it for Javascript development.

I use Adobe's [Source Code Pro][4] font.

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
git clone https://github.com/yoaquim/.vim.git ~/
```

You're gonna wanna syslink the `vimrc` file to your actual `~/.vimrc`:
			
```Shell
ln -s ~/.vim/vimrc ~/.vimrc
```

Now you need to initialize and update the plugins, which are git submodules:

```Shell
cd ~/.vim
git submodule update --init
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

* [Expand Region] [5]
* [Airline][6]
* [Fugitive][7]
* [Goyo][8]
* [Vim-Zenroom2][9]
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

###Color Schemes###

* [Mango][21]
* [Solarize][20]
* [Molokai][22] (Monokai port)

###Some Shortcuts...###

* Spell checking 
* Wrap selection in brackets, parenthesis, etc.
* Easier window navigation
* Shortcuts for plugins

[1]:https://github.com/amix/vimrc
[2]:http://nodejs.org/
[3]:http://brew.sh/
[4]:http://store1.adobe.com/cfusion/store/html/index.cfm?event=displayFontPackage&code=1960
[5]:https://github.com/terryma/vim-expand-region
[6]:https://github.com/bling/vim-airline
[7]:https://github.com/tpope/vim-fugitive
[8]:https://github.com/junegunn/goyo.vim
[9]:https://github.com/amix/vim-zenroom2
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
[20]:http://ethanschoonover.com/solarized/vim-colors-solarized
[21]:https://github.com/goatslacker/mango.vim
[22]://github.com/tomasr/molokai
[90]:https://github.com/joyent/node/wiki/Vim-Plugins
