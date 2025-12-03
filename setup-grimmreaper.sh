#!/bin/bash
# =============================================================================
#   GRIMMREAPER'S FULL KALI/XFCE CYBERPUNK SETUP SCRIPT – December 2025
#   Run on fresh Kali Linux (XFCE) to get 100% of your environment
# =============================================================================

set -e  # Exit on any error

echo -e "\nStarting GRIMMREAPER Cyberpunk Setup...\n"

# Update system
sudo apt update && sudo apt full-upgrade -y

# Core tools + dependencies
sudo apt install -y \
    curl wget git unzip build-essential \
    xfce4 xfce4-goodies \
    kitty zsh neovim python3-neovim \
    fzf ripgrep fd-find bat exa powerline fonts-powerline \
    nerd-fonts-jetbrains-mono

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
fi

# Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || true
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting || true
git clone https://github.com/marlonrichert/zsh-shift-select.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-shift-select || true

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Fastfetch
if ! command -v fastfetch >/dev/null; then
    echo "Installing fastfetch..."
    curl -sS https://api.github.com/repos/fastfetch-cli/fastfetch/releases/latest \
    | grep "browser_download_url.*linux-amd64.deb" \
    | cut -d : -f 2,3 \
    | tr -d '"' \
    | wget -qi -
    sudo dpkg -i fastfetch_*.deb 2>/dev/null || sudo apt install -f -y
    rm -f fastfetch_*.deb
else
    echo "fastfetch already installed"
fi

# Vim-Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Open Code CLI
curl -fsSL https://opencode.ai/install | bash

# Create config directories
mkdir -p ~/.config/{kitty,nvim,fastfetch,starship}

# === CONFIG FILES ===
cat > ~/.zshrc << 'EOF'
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="gruvbox"
# SOLARIZED_THEME="dark"
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    sudo
    web-search
    # copypath
    # copyfile
    # copybuffer
    dirhistory
    alias-tips
    zsh-shift-select
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#928374,bold"  # gruvbox comment color
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_MANUAL_REBIND=1   # big speedup on large histories


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
#alias zshconfig="mate ~/.zshrc"
#alias ohmyzsh="mate ~/.oh-my-zsh"
# 🌆 CYBERPUNK ALIASES 🌆
alias ll='ls -lah --color=auto'
alias nse='ls /usr/share/nmap/scripts | grep'
alias serve='python3 -m http.server'
alias v='nvim'
alias vim='nvim'
alias tun0='ip a show tun0 | grep inet | awk "{print \$2}" | cut -d/ -f1'
alias myip='curl ifconfig.me'
alias vconf='nvim ~/.config/nvim/init.vim'
alias zconf='nvim ~/.zshrc'
alias starconf='nvim ~/.config/starship.toml'
alias kconf='nvim ~/.config/kitty/kitty.conf'
alias fastconf='nvim ~/.config/fastfetch/config.jsonc'
alias notes='nvim ~/Documents/notes/notes.md'
alias todo='nvim ~/Documents/notes/todo.md'
alias shortcuts='nvim ~/Documents/notes/shortcuts.md'


# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Ctrl-T, Ctrl-R, Alt-C from fzf
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border --prompt='λ ' --color=dark"

eval "$(starship init zsh)"
#
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Custom Cyberpunk Prompt
# PROMPT='%F{196}%B%n%b%f%F{51}@%f%F{141}%m%f %F{33}%~%f %F{green}$(git_prompt_info)%f
# %F{magenta}❯%f '

# TrueColor support
#allow_remote_control yes
#color_space rgb
export COLORTERM=truecolor
export TERM=xterm-256color

[[ -t 1 ]] && fastfetch

# opencode
export PATH=/home/kali/.opencode/bin:$PATH
EOF

# Kitty config
cat > ~/.config/kitty/kitty.conf << 'EOF'
##########################################
#   FONT SETTINGS (NERD FONT REQUIRED)   #
##########################################

font_family      JetBrainsMono Nerd Font
bold_font        JetBrainsMono Nerd Font Bold
italic_font      JetBrainsMono Nerd Font Italic
bold_italic_font JetBrainsMono Nerd Font Bold Italic
font_size 12.0

##########################################
#   TRANSPARENCY  (0.0 = Clear, 1.0 = Opaque)
##########################################

background_opacity       0.6
# dynamic_background_opacity yes

##########################################
#   COLORS — GRUVBOX DARK HARD           #
##########################################

background            #1d2021
foreground            #ebdbb2
selection_background  #504945
selection_foreground  #ebdbb2
cursor                #ebdbb2

color0  #282828
color1  #cc241d
color2  #98971a
color3  #d79921
color4  #458588
color5  #b16286
color6  #689d6a
color7  #a89984

color8  #928374
color9  #fb4934
color10 #b8bb26
color11 #fabd2f
color12 #83a598
color13 #d3869b
color14 #8ec07c
color15 #ebdbb2

##########################################
#   TERMINAL BEHAVIOR                    #
##########################################

# TrueColor
color_space rgb
allow_remote_control yes

# Improve rendering on HiDPI displays
enable_audio_bell no
cursor_shape block
cursor_blink_interval 0.45

# Smooth background + padding
window_padding_width 8

# Scrolling
scrollback_lines 10000

# Make text crisp
disable_ligatures never

repaint_delay 10
sync_to_monitor yes


##########################################
#   KEYBOARD & INPUT                     #
##########################################
# Doesnt intercep ctrl + /
map ctrl+/ send_text all \x1f

map ctrl+backspace send_text all \x17
# map ctrl+delete send_text all \x1bd

# Don't intercept the following key strokes to make zsh-shift-select work.
map ctrl+shift+left no_op
map ctrl+shift+right no_op
map ctrl+shift+home no_op
map ctrl+shift+end no_op


# Use Kitty terminfo
term xterm-kitty

##########################################
#   OPTIONAL — if using Zsh + Starship   #
##########################################

# Uncomment if needed:
shell zsh


##########################################
# WINDOW & TAB MANAGEMENT
##########################################

# Enable layouts
enabled_layouts splits,stack,tall

# Split windows (tmux-style)
map ctrl+shift+backslash launch --location=vsplit --cwd=current
map ctrl+shift+minus launch --location=hsplit --cwd=current

# Navigate between windows (vim-style)
map ctrl+shift+h neighboring_window left
map ctrl+shift+l neighboring_window right
map ctrl+shift+k neighboring_window up
map ctrl+shift+j neighboring_window down

# Move windows around
map ctrl+alt+left move_window left
map ctrl+alt+right move_window right
map ctrl+alt+up move_window up
map ctrl+alt+down move_window down

# Resize windows
map ctrl+shift+alt+left resize_window narrower 2
map ctrl+shift+alt+right resize_window wider 2
map ctrl+shift+alt+up resize_window taller 2
map ctrl+shift+alt+down resize_window shorter 2

# Close window (like tmux C-b x)
map ctrl+shift+w close_window

# Rotate through layouts
map ctrl+shift+r next_layout

# Zoom/unzoom window (toggle full screen for current pane)
map ctrl+shift+z toggle_layout stack

# Reset all windows to equal size
map ctrl+shift+equal resize_window reset

##########################################
# TAB MANAGEMENT
##########################################

# New tab in current directory
map ctrl+shift+t new_tab_with_cwd

# Navigate tabs
map ctrl+shift+right_bracket next_tab
map ctrl+shift+left_bracket previous_tab

# Go to specific tab by number
map ctrl+shift+1 goto_tab 1
map ctrl+shift+2 goto_tab 2
map ctrl+shift+3 goto_tab 3
map ctrl+shift+4 goto_tab 4
map ctrl+shift+5 goto_tab 5
map ctrl+shift+6 goto_tab 6
map ctrl+shift+7 goto_tab 7
map ctrl+shift+8 goto_tab 8
map ctrl+shift+9 goto_tab 9

# Close tab
map ctrl+shift+q close_tab

# Rename tab
map ctrl+shift+alt+t set_tab_title

# Move tabs
map ctrl+shift+period move_tab_forward
map ctrl+shift+comma move_tab_backward

##########################################
# VISUAL SETTINGS FOR WINDOWS & TABS
##########################################

# Window borders (Gruvbox colors)
active_border_color #fabd2f
inactive_border_color #504945
bell_border_color #fb4934

# Border width
window_border_width 1pt

# Spacing between windows
window_margin_width 2

# Tab bar position and style
tab_bar_edge top
tab_bar_style powerline
tab_powerline_style slanted

# Tab bar colors (Gruvbox)
active_tab_foreground   #282828
active_tab_background   #fabd2f
active_tab_font_style   bold
inactive_tab_foreground #ebdbb2
inactive_tab_background #3c3836
inactive_tab_font_style normal

# Tab bar margin
tab_bar_margin_width 0.0
tab_bar_margin_height 0.0 0.0

##########################################
# ADDITIONAL USEFUL MAPPINGS
##########################################

# New OS window (completely separate Kitty instance)
map ctrl+shift+n new_os_window

# Toggle fullscreen
map ctrl+shift+f11 toggle_fullscreen

# Open scrollback in editor
map ctrl+shift+g show_scrollback

# Clear scrollback
map ctrl+shift+delete clear_terminal scrollback active

EOF

# Starship Configs
cat > ~/.config/starship.toml << 'EOF'
format = """\
[╭╴](fg:arrow)\
$username\
    $time \
$os\
$git_branch\
(\
    $directory\
)\
$cmd_duration\
(\
    via \
    $python\
    $conda\
    $nodejs\
    $c\
    $rust\
    $java\
)
[╰─](fg:arrow)$character\
"""
# Add the modules you need

# Disable the blank line at the start of the prompt
add_newline = true


palette = "normal"


[palettes.normal]
arrow = "#333533"
os = "#16f4d0"
os_admin = "#e4ff1a"
directory = "#9ffff5"
duration = "#bdfffd"
node = "#a5e6ba"
git = "#f17f29"
git_status = "#DFEBED"
python = "#edf67d"
conda = "#70e000"
java = "#F86279"
rust = "#ffdac6"
clang = "#caf0f8"
time = "#ce4257"
text_color = "#EDF2F4"
text_light = "#26272A"

# I disabled some modules (Rust, Java...) since some things aren't installed in my machine, enable them if you need.

[username]
style_user = 'bold os'
style_root = 'bold os_admin'
# format = '[  $user](fg:$style) '
format = '[ GRIMMREAPER](fg:$style) '
disabled = false
show_always = true

[os]
format = "on [($name)]($style) "
style = "bold blue"
disabled = false

[os.symbols]
Alpine = " "
Arch = " "
Debian = " "
EndeavourOS = " "
Fedora = " "
Linux = " "
Macos = " "
Manjaro = " "
Mint = " "
NixOS = " "
openSUSE = " "
Pop = " "
SUSE = " "
Ubuntu = " "
Windows = " "

# [time]
# time_format = '%a %b %d %H:%M:%S' # Example: Sun Feb 28 15:20:19

[character]
success_symbol = "[󰍟](fg:arrow)"
error_symbol = "[󰍟](fg:red)"

[directory]
format = "[$path](bold $style)[$read_only]($read_only_style) "
truncation_length = 2
style = "fg:directory"
read_only_style = "fg:directory"
before_repo_root_style = "fg:directory"
truncation_symbol = "…/"
truncate_to_repo = true
read_only ="  "

[time]
disabled = false
format = "at [󱑈 $time]($style)"
time_format = "%I:%M %p %a %b, %d"
style = "bold fg:time"

[cmd_duration]
format = "took [ $duration]($style) "
style = "bold fg:duration"
min_time = 500

[git_branch]
format = "via [$symbol$branch]($style) "
style = "bold fg:git"
symbol = " "

[git_status]
format = '[ $all_status$ahead_behind ]($style)'
style = "fg:text_color bg:git"
disabled = true

[docker_context]
disabled=true
symbol = " "

[package]
disabled=false

[fill]
symbol = " "

[nodejs]
format = "[ $symbol$version ]($style)"
style = "bg:node fg:text_light"
symbol = " "
version_format = "${raw}"
disabled=false

[python]
disabled=false
format = '[ ${symbol}${pyenv_prefix}(${version})( \($virtualenv\)) ]($style)'
symbol = " "
version_format = "${raw}"
style = "bg:python fg:text_light"

[conda]
format = "[ $symbol$environment ]($style)"
style = "bg:conda fg:text_light"
ignore_base = false
disabled = false
symbol = " "

[java]
format = "[ $symbol$version ]($style)"
style = "bg:java fg:text_light"
version_format = "${raw}"
symbol = " "
disabled = true

[c]
format = "[ $symbol($version(-$name)) ]($style)"
style = "bg:clang fg:text_light"
symbol = " "
version_format = "${raw}"
disabled=true

[rust]
format ="[ $symbol$version ]($style)"
style = "bg:rust fg:text_light"
symbol = " "
version_format = "${raw}"
disabled=true
EOF

# Fastfetch config
cat > ~/.config/fastfetch/config.jsonc << 'EOF'
{
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    "logo": {
        "type": "builtin",
        // "source": "xenia_old", // fox bandit
        "source": "pacBSD", // red pacman evil
        // "source": "darkOS", // wolf rainbow
        // "source": "blackarch", // arch red
        // "source": "centOS",
        "padding": {
            "top": 2,
            "left": 4
        }
        // "color": {
        //     "1": "#ff1b6b",   // neon red
        //     "2": "#ff0066",
        //     "3": "#c678dd",   // purple
        //     "4": "#89ddff",   // cyan
        //     "5": "#ff1b6b",   // hot pink
        //     "6": "#bd93f9",   // lavender
        //     "7": "#8be9fd",   // electric blue
        //     "8": "#ffffff",
        //     "9": "#ff5555"
        // }
    },
    "display": {
        "separator": " : ",
        "color": "red" // key value pair is red of names
    },
    "modules": [
        "title",
        "separator",
        "os",
        "host",
        "kernel",
        "uptime",
        "packages",
        "shell",
        "display",
        "de",
        "wm",
        "wmtheme",
        "theme",
        "icons",
        "font",
        "cursor",
        "terminal",
        "terminalfont",
        "cpu",
        "gpu",
        "memory",
        "swap",
        "disk",
        "localip",
        "battery",
        "poweradapter",
        "locale",
        "break",
        "colors"
    ]
}
EOF

# Neovim config (init.vim)
mkdir -p ~/.config/nvim/undodir
cat > ~/.config/nvim/init.vim << 'EOF'

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
EOF

# XFCE Keyboard Shortcuts (your exact list)

echo "Applying only GRIMMREAPER's custom XFCE shortcuts (non-default ones)..."

# ─────────────────────────────────────────────────────────────
# 1. Custom application/command shortcuts
# ─────────────────────────────────────────────────────────────
xfconf-query -c xfce4-keyboard-shortcuts -c commands -p /commands/custom/override -n -t bool -s true

xfconf-query -c xfce4-keyboard-shortcuts -c commands -p /commands/custom/<Alt>Print                 -n -t string -s "/usr/share/kali-themes/xfce4-screenshooter --window"
xfconf-query -c xfce4-keyboard-shortcuts -c commands -p /commands/custom/<Primary><Alt>Print       -n -t string -s "/usr/share/kali-themes/xfce4-screenshooter --window --clipboard"
xfconf-query -c xfce4-keyboard-shortcuts -c commands -p /commands/custom/<Primary><Alt>t           -n -t string -s "/usr/bin/kitty"
xfconf-query -c xfce4-keyboard-shortcuts -c commands -p /commands/custom/<Primary>Print            -n -t string -s "/usr/share/kali-themes/xfce4-screenshooter --fullscreen --clipboard"
xfconf-query -c xfce4-keyboard-shortcuts -c commands -p /commands/custom/<Primary><Shift>Print    -n -t string -s "/usr/share/kali-themes/xfce4-screenshooter --region --clipboard"
xfconf-query -c xfce4-keyboard-shortcuts -c commands -p /commands/custom/<Shift>Print              -n -t string -s "/usr/share/kali-themes/xfce4-screenshooter --region"
xfconf-query -c xfce4-keyboard-shortcuts -c commands -p /commands/custom/<Super>b                  -n -t string -s "/usr/bin/brave-browser"
xfconf-query -c xfce4-keyboard-shortcuts -c commands -p /commands/custom/<Super>F1                -n -t string -s "xfce4-find-cursor"

# ─────────────────────────────────────────────────────────────
# 2. Custom xfwm4 (window manager) shortcuts i changed
# ─────────────────────────────────────────────────────────────
xfconf-query -c xfce4-keyboard-shortcuts -c xfwm4 -p /xfwm4/custom/override -n -t bool -s true

xfconf-query -c xfce4-keyboard-shortcuts -c xfwm4 -p /xfwm4/custom/<Primary><Super>Down    -n -t string -s "tile_down_key"
xfconf-query -c xfce4-keyboard-shortcuts -c xfwm4 -p /xfwm4/custom/<Primary><Super>Up      -n -t string -s "tile_up_key"
xfconf-query -c xfce4-keyboard-shortcuts -c xfwm4 -p /xfwm4/custom/<Super>KP_1            -n -t string -s "tile_down_left_key"
xfconf-query -c xfce4-keyboard-shortcuts -c xfwm4 -p /xfwm4/custom/<Super>KP_3            -n -t string -s "tile_down_right_key"
xfconf-query -c xfce4-keyboard-shortcuts -c xfwm4 -p /xfwm4/custom/<Super>KP_7            -n -t string -s "tile_up_left_key"
xfconf-query -c xfce4-keyboard-shortcuts -c xfwm4 -p /xfwm4/custom/<Super>KP_9            -n -t string -s "tile_up_right_key"
xfconf-query -c xfce4-keyboard-shortcuts -c xfwm4 -p /xfwm4/custom/<Super><Shift>Up      -n -t string -s "move_window_up_workspace_key"
xfconf-query -c xfce4-keyboard-shortcuts -c xfwm4 -p /xfwm4/custom/<Super><Shift>Down    -n -t string -s "move_window_down_workspace_key"
xfconf-query -c xfce4-keyboard-shortcuts -c xfwm4 -p /xfwm4/custom/<Super><Shift>Left    -n -t string -s "left_workspace_key"
xfconf-query -c xfce4-keyboard-shortcuts -c xfwm4 -p /xfwm4/custom/<Super><Shift>Right   -n -t string -s "right_workspace_key"


echo -e "\nSetup complete! Please run:"
echo "   nvim +'PlugInstall --sync' +qa"
echo "   chsh -s /usr/bin/zsh"
echo "   Reboot or log out/in"

echo -e "\nGRIMMREAPER setup finished. Stay dangerous."
