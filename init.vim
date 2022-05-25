:set number
:set relativenumber
":set autoindent
":set tabstop=4
":set shiftwidth=4
":set smarttab
":set softtabstop=4
":set mouse=a

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary' "For gc and gcc
"Plug 'https://github.com/ap/vim-css-color' "For CSS
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
"Plug 'https://github.com/ryanoasis/vim-devicons' "Haven't explored yet
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/mg979/vim-visual-multi'
"Plug 'https://github.com/preservim/tagbar' "Cool tagbar haven't explored
Plug 'https://github.com/neoclide/coc.nvim' "Requires stuff to be installed: nodejs, npm
":CocInstall coc-python
"Need to install nodejs from source
"curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
"sudo apt-get install -y nodejs
"cd .config/nvim/plugged/coc.nvim
"sudo npm install -g yarn
"yarn install
"pip3 install jedi
Plug 'tmsvg/pear-tree'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
"cd venvs    #If doesn't exist make it
"python -m venv debugpy
"debugpy/bin/python -m pip install debugpy

call plug#end()

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-N> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>


map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

:colorscheme molokayo


lua require('dap-python').setup('~/venv/debugpy/bin/python')
