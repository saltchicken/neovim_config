### Installation

#### Install basic requirements
##### Ubuntu
```
sudo apt install python3 python3-pip python3-venv curl git npm
```

#### Install neovim
##### Ubuntu
```
curl -LO "https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb"
```

#### Install nodejs
##### Ubuntu
```
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
```

#### Create neovim's config directory and copy init.vim
```
mkdir ~/.config/nvim
cp init.vim ~/.config/nvim
```

#### Install vim-plug
##### Ubuntu
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

#### Setup plugins in neovim
```
:PlugInstall
```

#### Setup coc (jedi)
```
cd .local/share/nvim/plugged/coc.nvim
sudo npm install -g yarn
yarn install
pip3 install jedi
```

###### Exit and reopen neovim
```
:CocInstall coc-python
:TSInstall python
```

### Setup dap (debugpy)
```
mkdir venvs && cd venvs
python3 -m venv debugpy
debugpy/bin/python -m pip install debugpy
```
###### In neovim
```
:TSInstall python
```

```
