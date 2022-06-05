:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
":set mouse=a

:set splitbelow
:set splitright

call plug#begin()

"Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary' "For gc and gcc
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
"Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/mg979/vim-visual-multi'
Plug 'https://github.com/neoclide/coc.nvim' 
Plug 'tmsvg/pear-tree'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'https://github.com/preservim/tagbar' 
Plug 'https://github.com/ryanoasis/vim-devicons' 
Plug 'https://github.com/thanthese/tortoise-typing'
Plug 'akinsho/toggleterm.nvim'
Plug 'https://github.com/saltchicken/nvim-benchmark-python'

call plug#end()

"Use F9 to run current python script
"autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python map <buffer> <F9> :w<CR>:TermExec cmd="python3 %:t" direction=float<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:TermExec cmd="python3 %:t" direction=float<CR>

"NERDTree keybinds
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-N> :NERDTree<CR>
nnoremap <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"ToggleTerm keybinds
nnoremap <C-t> :ToggleTerm direction=float<CR>
tnoremap <Esc> <C-\><C-n>
tmap <C-t> <C-\><C-n><C-t>

"Split window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Use tab to select autofill
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

"DAP calls
noremap <leader>db :lua require('dap').toggle_breakpoint()
noremap <leader>dsi :lua require('dap').step_into()
noremap <leader>dso :lua require('dap').step_over()
noremap <leader>dc :lua require('dap').continue()

" nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
" nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
" vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

map <silent> <leader><cr> :noh<cr>

lua require('dap-python').setup('~/venv/debugpy/bin/python')
lua require("toggleterm").setup{}

:colorscheme molokayo

