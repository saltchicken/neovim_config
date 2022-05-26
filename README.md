### Installation

```
sudo apt install python3 python3-pip curl git npm

curl -LO "https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb"

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

```

```

mkdir ~/.config/nvim
cp init.vim ~/.config/nvim


```

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Open nvim and run :PlugInstall
Exit and reopen nvim
Run :CocInstall coc-python
Run :TSInstall python
```
cd .config/nvim/plugged/coc.nvim
sudo npm install -g yarn
yarn install
pip3 install jedi

mkdir venvs && cd venvs
python3 -m venv debugpy
debugpy/bin/python -m pip install debugpy



```
