" fuzzy stuff
set path+=**

" all the colors
set termguicolors

" Number
set relativenumber
set number

" persistant undo
set undodir=~/.cache/vim/undodir
set undofile

" Better searching
set smartcase
set ignorecase

" better wildmenu
set wildmenu
set wildmode=longest:full,full

" scrol options
set scrolloff=1

"Tab fixes
set expandtab
set shiftwidth=2
set tabstop=2

" Set cursorline
set cursorline

" Remap jk to escape
imap jk <Esc>
let mapleader = ","

call plug#begin('~/.local/share/nvim/plugged')

" #Plugins
" ## Better search
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
Plug 'honza/vim-snippets'
Plug 'phenomenes/ansible-snippets'
Plug 'pearofducks/ansible-vim'
Plug 'plasticboy/vim-markdown'
Plug 'b4b4r07/vim-ansible-vault'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
" Eye candy
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
" Plug 'scrooloose/nerdcommenter'
Plug 'benekastah/neomake'
Plug 'tpope/vim-surround'
" Plug 'tomtom/tcomment_vim'
" different cursors in different modes
Plug 'sjl/vitality.vim'
Plug 'glench/vim-jinja2-syntax'
Plug 'pprovost/vim-ps1'
" docker stuff
Plug 'ekalinin/dockerfile.vim'
Plug 'pedrohdz/vim-yaml-folds'
" nice vim tables
Plug 'dhruvasagar/vim-table-mode'
Plug 'christoomey/vim-tmux-navigator'
" pandoc integration
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" sneaky sneaky
Plug 'justinmk/vim-sneak'
" Some more terminal fun
"Plug 'kassio/neoterm'
" fzf magic
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()


"Nice airline theme
" let g:airline_theme='gruvbox'
" let g:airline_gruvbox_bg='dark'
" let g:lightline = {
"       \ 'colorscheme': 'gruvbox',
"       \ }
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'
"let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:airline_powerline_fonts = 1

"map <C-m> :NERDComToggleComment<CR>
filetype plugin on

" Vim theme
syntax enable
colorscheme gruvbox
set background=dark

" auto delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Key remaps
inoremap <Q> :!!$SHELL<CR>

" NERDCommenter to Crtl-m
vmap <silent><C-m> <Plug>TComment

" interactive search and replace
set inccommand=nosplit

" no more highlight after return
nnoremap <CR> :nohlsearch<cr>

" foldmagic
" nnoremap <Space> zA
" let g:vim_markdown_folding_level = 3
set nofoldenable

" markdown compatible tables
let g:table_mode_corner='|'

" moving in vim
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" close terminal mode with escape
:tnoremap <Esc> <C-\><C-n>

"own snippets
nnoremap ,bash :-1read $HOME/.config/nvim/snippets/strictbash.sh<CR>Go

"disabled ex mode
:map Q <Nop>

" Neomake instead of syntastic
call neomake#configure#automake('nrwi', 500)

" Requires ansible-lint to be installed.
let g:neomake_ansible_ansiblelint_maker = {
    \ 'exe': 'ansible-lint',
    \ 'args': ['-p'],
    \ 'errorformat': '%E%f:%l: [ANSIBLE%n] %m,%W%f:%l: [ANSIBLE%n] %m',
    \ }
let g:neomake_ansible_enabled_makers = ['ansiblelint']


" Diable stupid auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"enabled some fzf magic
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

" W for sudo write file
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Find files using Telescope command-line sugar.

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
