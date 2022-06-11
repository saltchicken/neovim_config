:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set splitbelow
:set splitright
":set relativenumber
":set mouse=a

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
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'https://github.com/preservim/tagbar' 
Plug 'https://github.com/ryanoasis/vim-devicons' 
Plug 'https://github.com/thanthese/tortoise-typing'
Plug 'akinsho/toggleterm.nvim'
Plug 'https://github.com/saltchicken/nvim-benchmark-python'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

nnoremap <SPACE> <Nop>
let mapleader = " "

"Use F9 to run current python script
"autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python map <buffer> <F9> :w<CR>:TermExec cmd="python3 %:t" direction=float<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:TermExec cmd="python3 %:t" direction=float<CR>
autocmd FileType python map <buffer> <F8> :w<CR>:TermExec cmd="pytest" direction=float<CR>
autocmd FileType python imap <buffer> <F8> <esc>:w<CR>:TermExec cmd="pytest" direction=float<CR>

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

"Telescope keybinds
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"DAP calls
noremap <leader>db :lua require('dap').toggle_breakpoint()<CR>
noremap <leader>dc :lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
noremap <leader>dr :lua require('dap').repl.open()<CR>
noremap <F5> :lua require('dap').continue()<CR>
noremap <F6> :lua require('dap').step_over()<CR>
noremap <F7> :lua require('dap').step_into()<CR>
" :lua require('dapui').open()<CR>

" nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
" nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
" vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

map <silent> <leader><cr> :noh<cr>

lua require('dap-python').setup('~/venv/debugpy/bin/python')
lua require("toggleterm").setup{}
lua require("dapui").setup()

lua << EOF
local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
EOF

:colorscheme molokayo

