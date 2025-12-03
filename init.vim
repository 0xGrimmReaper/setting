" ═══════════════════════════════════════════════════════════
"  🌆 CYBERPUNK NEOVIM CONFIGURATION 🌆
"  Professional Setup for Python & JavaScript
" ═══════════════════════════════════════════════════════════

" ─────────────────────────────────────────────────────────
" VIM-PLUG PLUGINS
" ─────────────────────────────────────────────────────────
call plug#begin('~/.local/share/nvim/plugged')

" Cyberpunk Theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'

" File Explorer
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Status Line
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Code Completion & LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Code Formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'psf/black', { 'branch': 'stable' }

" Auto Pairs & Commenting
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Snippets
Plug 'honza/vim-snippets'

" Terminal
Plug 'voldikss/vim-floaterm'

" Indent Guides
Plug 'lukas-reineke/indent-blankline.nvim'

" Which Key - shows keybindings
Plug 'folke/which-key.nvim'

" Dashboard
Plug 'glepnir/dashboard-nvim'

" Multi Line cursor edit
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-surround'

" Markdown Plugins
Plug 'MeanderingProgrammer/render-markdown.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'tadmccorkle/markdown.nvim'
Plug 'lukas-reineke/headlines.nvim'
Plug 'dkarter/bullets.vim'

call plug#end()

" ─────────────────────────────────────────────────────────
" BASIC SETTINGS
" ─────────────────────────────────────────────────────────
set number
set relativenumber                  " Line numbers
set mouse=a                         " Enable mouse
set encoding=utf-8                  " UTF-8 encoding
set hidden                          " Allow hidden buffers
set nowrap                          " No line wrapping
set pumheight=10                    " Popup menu height
set cmdheight=2                     " Command line height
set updatetime=300                  " Faster completion
set timeoutlen=500                  " Faster key sequence
set clipboard=unnamedplus           " System clipboard
set splitbelow splitright           " Split windows below/right

" Tabs & Indentation
set tabstop=4 shiftwidth=4 expandtab
set smartindent autoindent
set smartcase ignorecase            " Smart case searching

" UI Enhancements
set termguicolors                   " True color support
set signcolumn=yes                  " Always show sign column
set cursorline                      " Highlight current line
set showmatch                       " Show matching brackets

" Performance
set lazyredraw                      " Don't redraw during macros
set synmaxcol=241                   " Max column for syntax highlight

" Backup & Undo
set nobackup nowritebackup noswapfile
set undofile undodir=~/.config/nvim/undodir

" Better search
set inccommand=split        " Show live substitution preview
set gdefault                " Default to /g flag for substitutions

" Better splitting
set splitkeep=screen        " Keep screen position when splitting

" Scroll offset
set scrolloff=8             " Keep 8 lines above/below cursor
set sidescrolloff=8         " Keep 8 columns left/right of cursor

" Better completion
set completeopt=menu,menuone,noselect

" Case-insensitive filename completion
set wildignorecase

" Better mouse support
set mousemoveevent          " Allow hover plugins to work

" ─────────────────────────────────────────────────────────
" CYBERPUNK THEME CONFIGURATION
" ─────────────────────────────────────────────────────────
" Tokyo Night theme (cyberpunk neon blue/purple)
" let g:tokyonight_style = 'storm'
" let g:tokyonight_enable_italic = 1
" let g:tokyonight_transparent_sidebar = 0
" colorscheme tokyonight
"
" -------- GRUVBOX
let g:gruvbox_contrast_dark = 'hard'      " soft, medium, hard
let g:gruvbox_contrast_light = 'medium'
let g:gruvbox_italic = 1                  " Enable italics
let g:gruvbox_bold = 1                    " Enable bold
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

" Alternative themes (uncomment to use):
colorscheme gruvbox
" colorscheme nord
" colorscheme dracula
"
" Enable transparency (must be AFTER colorscheme)
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE

" Optional: Make more elements transparent
highlight VertSplit guibg=NONE ctermbg=NONE
highlight StatusLine guibg=NONE ctermbg=NONE
highlight StatusLineNC guibg=NONE ctermbg=NONE

" Airline Theme
" let g:airline_theme='tokyonight'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Airline symbols (if powerline fonts are installed)
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
  endif

  " Unicode symbols for airline
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ' ☰ '
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.dirty='⚡'
"
  " Show buffer numbers in tabline
  let g:airline#extensions#tabline#buffer_nr_show = 1

" ─────────────────────────────────────────────────────────
" KEY MAPPINGS
" ─────────────────────────────────────────────────────────
let mapleader = " "                 " Space as leader key

" jk to escape insert mode
inoremap jk <Esc>
inoremap kj <Esc>

" Ctrl + / to comment (using Ctrl + _ which is Ctrl + / in terminals)
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>
inoremap <C-_> <Esc>:Commentary<CR>i

" Alt + j/k to move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Alt + Shift + j/k to copy line down/up
nnoremap <A-J> :t.<CR>
nnoremap <A-K> :t.-1<CR>
inoremap <A-J> <Esc>:t.<CR>gi
inoremap <A-K> <Esc>:t.-1<CR>gi
vnoremap <A-J> :t'><CR>gv
vnoremap <A-K> :t'<<CR>gv

" Ctrl+C to copy in visual mode
vnoremap <C-c> "+y

" Ctrl+V to paste
nnoremap <C-v> "+p
vnoremap <C-v> "+p
inoremap <C-v> <C-r>+

" Better window navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Resize windows
" nnoremap <C-Up> :resize +2<CR>
" nnoremap <C-Down> :resize -2<CR>
" nnoremap <C-Left> :vertical resize -2<CR>
" nnoremap <C-Right> :vertical resize +2<CR>

" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" FZF
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :Rg<CR>

" Save & Quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa!<CR>


" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Quit with Ctrl+Q
nnoremap <C-q><C-q> :q<CR>

" Buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Wrap words = V highlight + space + " ... etc
xnoremap <silent> <leader>" <esc>`>a"<esc>`<i"<esc>
xnoremap <silent> <leader>' <esc>`>a'<esc>`<i'<esc>
xnoremap <silent> <leader>` <esc>`>a`<esc>`<i`<esc>
xnoremap <silent> <leader>{ <esc>`>a}<esc>`<i{<esc>
xnoremap <silent> <leader>} <esc>`>a}<esc>`<i{<esc>
xnoremap <silent> <leader>( <esc>`>a)<esc>`<i(<esc>
xnoremap <silent> <leader>) <esc>`>a)<esc>`<i(<esc>
xnoremap <silent> <leader>[ <esc>`>a]<esc>`<i[<esc>
xnoremap <silent> <leader>] <esc>`>a]<esc>`<i[<esc>


" Split navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Clear search highlighting
nnoremap <Esc><Esc> :nohlsearch<CR>

" Terminal
nnoremap <leader>t :FloatermNew<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>

" Tab navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Clear search highlight
nnoremap <leader>h :noh<CR>

" Keep visual selection when indenting
vnoremap < <gv
vnoremap > >gv


" Markdown
nnoremap <leader>mp :MarkdownPreview<CR>
nnoremap <leader>ms :MarkdownPreviewStop<CR>
nnoremap <leader>mt :MarkdownPreviewToggle<CR>

" Tell Vim NOT to use Shift+Arrow keys
" set <S-Left>=
" set <S-Right>=
" set <S-Up>=
" set <S-Down>=

" Markdown Plugin code block
lua << EOF
require('render-markdown').setup({
  enabled = true,
  heading = {
    enabled = true,
    icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
  },
  code = {
    enabled = true,
    width = 'block',
  },
})
EOF

" Add to on_attach or init.vim
lua << EOF
require('markdown').setup({
  mappings = {
    inline_surround_toggle = 'gs',      -- Toggle bold/italic/code
    inline_surround_toggle_line = 'gss', -- Toggle for line
    inline_surround_delete = 'ds',       -- Delete surrounding
    inline_surround_change = 'cs',       -- Change surrounding
  },
  on_attach = function(bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set('n', '<leader>mc', '<Cmd>MDTaskToggle<CR>', opts)
    vim.keymap.set('x', '<leader>mc', ':MDTaskToggle<CR>', opts)
    vim.keymap.set('n', '<leader>mt', '<Cmd>MDInsertToc<CR>', opts)
  end,
})
EOF

" Prevent auto-commenting on new lines (o, O, Enter)
augroup DisableAutoComment
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END


" ─────────────────────────────────────────────────────────
" COC CONFIGURATION (Code Completion)
" ─────────────────────────────────────────────────────────
" Use tab for trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Format code
nmap <leader>F <Plug>(coc-format-selected)
vmap <leader>F <Plug>(coc-format-selected)

" Show all diagnostics
nnoremap <silent> <leader>d :<C-u>CocList diagnostics<cr>

" ─────────────────────────────────────────────────────────
" NERDTREE CONFIGURATION
" ─────────────────────────────────────────────────────────
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['^node_modules$', '^\.git$', '^__pycache__$']
let g:NERDTreeStatusline = ''

" Auto close if NERDTree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

" ─────────────────────────────────────────────────────────
" FLOATERM CONFIGURATION
" ─────────────────────────────────────────────────────────
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_title = ' Terminal ($1/$2) '
let g:floaterm_borderchars = '─│─│╭╮╯╰'

" ─────────────────────────────────────────────────────────
" PYTHON SPECIFIC
" ─────────────────────────────────────────────────────────
augroup Python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
  autocmd FileType python nnoremap <buffer> <leader>R :w<CR>:!python3 %<CR>
  autocmd BufWritePre *.py execute ':Black'
augroup END

" ─────────────────────────────────────────────────────────
" JAVASCRIPT/TYPESCRIPT SPECIFIC
" ─────────────────────────────────────────────────────────
augroup JavaScript
  autocmd!
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact
        \ setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType javascript,typescript nnoremap <buffer> <leader>R :w<CR>:!node %<CR>
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx :Prettier
augroup END

" ─────────────────────────────────────────────────────────
" AUTO COMMANDS
" ─────────────────────────────────────────────────────────
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Return to last edit position
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
