# 🌆 Cyberpunk Terminal & Vim Configuration Reference
#### Run bash script to initialize setup

Quick reference for ZSH, Neovim, Kitty, Starship, Fastfetch, Opencode and installed tools, shortcuts and plugins

NOTES TODO

> ln 300 pt 2

---

## 🔧 ZSH Aliases

### 📁 Configuration Files

| Config    | Command    | Path                               |
| --------- | ---------- | ---------------------------------- |
| OpenCode  | `opencode` | `~/.config/opencode/opencode.json` |
| Neovim    | `vconf`    | `~/.config/nvim/init.vim`          |
| ZSH       | `zconf`    | `~/.zshrc`                         |
| Starship  | `starconf` | `~/.config/starship.toml`          |
| Kitty     | `kconf`    | `~/.config/kitty/kitty.conf`       |
| Fastfetch | `fastconf` | `~/.config/fastfetch/config.jsonc` |
| Notes     | `notes`    | `~/Documents/notes/notes.md`             |

---

#### OpenCode

`opencode run "Prompt"`
-- continue or -c

#### vim-visual-multi Multiline comment && Quote Wrap

> Multiline Comment with
`Ctrl + Up/Down Arrows`

> Comment Wrap with "", or ''
`Space + `

Comment UnWrap | ChangeSurround | DeleteSurround | InsertSurround <ysiw>

Surround.vim is all about "surroundings": parentheses, brackets, quotes,
XML tags, and more. The plugin provides mappings to easily delete,
change and add such surroundings in pairs.

It's easiest to explain with examples. Press `cs"'` inside

    "Hello world!"

to change it to

    'Hello world!'

Now press `cs'<q>` to change it to

    <q>Hello world!</q>

To go full circle, press `cst"` to get

    "Hello world!"

To remove the delimiters entirely, press `ds"`.

    Hello world!

Now with the cursor on "Hello", press `ysiw]` (`iw` is a text object).

    [Hello] world!

Let's make that braces and add some space (use `}` instead of `{` for no
space): `cs]{`

    { Hello } world!

Now wrap the entire line in parentheses with `yssb` or `yss)`.

    ({ Hello } world!)

Revert to the original text: `ds{ds)`

    Hello world!

Emphasize hello: `ysiw<em>`

    <em>Hello</em> world!

Finally, let's try out visual mode. Press a capital V (for linewise
visual mode) followed by `S<p class="important">`.

    <p class="important">
      <em>Hello</em> world!
    </p>

---

## 💻 Kitty Terminal

### Window Management (Tmux-style Splits)

#### **Split Panes:**

- `Ctrl+Shift+\` - Split vertically
- `Ctrl+Shift+-` - Split horizontally
- `Ctrl+Shift+W` - Close current pane

**Navigate Panes (Vim-style):**

    - `Ctrl+Shift+H` - Move to left pane
    - `Ctrl+Shift+L` - Move to right pane
    - `Ctrl+Shift+K` - Move to top pane
    - `Ctrl+Shift+J` - Move to bottom pane

    **Resize Panes:**

    - `Ctrl+Shift+Alt+Left` - Make narrower
    - `Ctrl+Shift+Alt+Right` - Make wider
    - `Ctrl+Shift+Alt+Up` - Make taller
    - `Ctrl+Shift+Alt+Down` - Make shorter
    - `Ctrl+Shift+=` - Reset to equal sizes

    **Window Actions:**

    - `Ctrl+Shift+Z` - Zoom/unzoom current pane (toggle fullscreen)

- `Ctrl+Shift+R` - Rotate through layouts (splits/stack/tall)
  - `Ctrl+Alt+Arrow` - Move pane position

#### Tab Management

    **Tab Operations:**

- `Ctrl+Shift+T` - New tab (opens in current directory)
  - `Ctrl+Shift+Q` - Close tab
  - `Ctrl+Shift+]` - Next tab
  - `Ctrl+Shift+[` - Previous tab
  - `Ctrl+Shift+1-9` - Jump to tab 1-9
  - `Ctrl+Shift+Alt+T` - Rename tab
  - `Ctrl+Shift+.` - Move tab forward
  - `Ctrl+Shift+,` - Move tab backward

#### Other Features

- `Ctrl+Shift+N` - New OS window (separate Kitty instance)
  - `Ctrl+Shift+F11` - Toggle fullscreen
  - `Ctrl+Shift+G` - Show scrollback in pager
  - `Ctrl+Shift+Delete` - Clear scrollback
- `Ctrl+/` - Passed through to shell (not intercepted)
  - `Ctrl+Backspace` - Delete word backward
- `Ctrl+Shift+Arrow` - Text selection (works with zsh-shift-select)

#### Visual Settings

    - **Font:** JetBrainsMono Nerd Font (12pt)
    - **Theme:** Gruvbox Dark Hard
    - **Scrollback:** 10,000 lines
    - **Padding:** 8px around terminal
    - **Opacity:** 60% (configurable)
    - **Active border:** Yellow (#fabd2f)
    - **Inactive border:** Dark gray (#504945)

---

#### General Utilities

- `ll` - Detailed list with colors (`ls -lah --color=auto`)
- `v` / `vim` - Open Neovim
- `serve` - Start HTTP server (`python3 -m http.server`)
- `myip` - Show external IP address

#### Network/Security

- `tun0` - Show tun0 IP address
- `nse` - Search Nmap scripts (`ls /usr/share/nmap/scripts | grep`)

---

## 🎨 ZSH Plugins

**Active Plugins:**

- `git` - Git integration and aliases
- `sudo` - Press ESC twice to add sudo to command
- `web-search` - Search from terminal (e.g., `google query`)
- `dirhistory` - Navigate directory history
- `zsh-shift-select` - Shift+Arrow text selection
- `zsh-autosuggestions` - Command suggestions from history
- `zsh-syntax-highlighting` - Command syntax highlighting

---

## ⌨️ FZF (Fuzzy Finder)

| Shortcut | Action                                |
| -------- | ------------------------------------- |
| `Ctrl+T` | Fuzzy find files in current directory |
| `Ctrl+R` | Fuzzy search command history          |
| `Alt+C`  | Fuzzy find and cd into directory      |

---

## 🚀 Neovim Shortcuts

### Leader Key

**Leader:** `Space`

### Essential Mappings

#### Insert Mode

- `jk` or `kj` - Exit insert mode (alternative to ESC)
- `Ctrl+S` - Save file
- `Ctrl+V` - Paste from clipboard
- `Ctrl+/` - Toggle comment

#### Normal Mode

**File Operations:**

- `Space+w` - Save file
- `Space+q` - Quit
- `Space+Q` - Quit all without saving
- `Ctrl+S` - Save
- `Ctrl+Q Ctrl+Q` - Quit
- `Esc Esc` - Clear search highlighting

**File Explorer (NERDTree):**

- `Space+e` - Toggle NERDTree
- `Space+f` - Find current file in NERDTree

**Fuzzy Finding (FZF):**

- `Space+p` - Find files
- `Space+b` - Browse open buffers
- `Space+r` - Ripgrep search in files

**Buffer Navigation:**

- `Tab` - Next buffer
- `Shift+Tab` - Previous buffer
- `Space+bd` - Delete buffer

**Window Navigation:**

- `Ctrl+h` - Move to left window
- `Ctrl+j` - Move to down window
- `Ctrl+k` - Move to up window
- `Ctrl+l` - Move to right window

**Window Resizing:**

- `Ctrl+Up` - Increase height
- `Ctrl+Down` - Decrease height
- `Ctrl+Left` - Decrease width
- `Ctrl+Right` - Increase width

**Line Manipulation:**

- `Alt+j` - Move line down
- `Alt+k` - Move line up
- `Ctrl+Alt+j` - Duplicate line down
- `Ctrl+Alt+k` - Duplicate line up

**Terminal:**

- `Space+t` - Open floating terminal
- `Esc` or `jk` - Exit terminal mode (in terminal)

**Code Actions:**

- `Space+h` - Clear search highlight
- `Ctrl+/` - Toggle comment (works in normal/visual/insert)

#### Visual Mode

- `Ctrl+C` - Copy to system clipboard
- `Ctrl+V` - Paste from clipboard
- `<` - Indent left (stays in visual mode)
- `>` - Indent right (stays in visual mode)
- `Alt+j` - Move selection down
- `Alt+k` - Move selection up
- `Shift+Alt+j` - Duplicate selection down
- `Shift+Alt+k` - Duplicate selection up

---

## 🔍 COC (Code Completion)

### Completion

- `Tab` - Next completion suggestion
- `Shift+Tab` - Previous completion suggestion
- `Enter` - Confirm completion

### Code Navigation

- `gd` - Go to definition
- `gy` - Go to type definition
- `gi` - Go to implementation
- `gr` - Show references
- `K` - Show documentation

### Code Actions

- `Space+rn` - Rename symbol
- `Space+F` - Format selected code (visual mode)
- `Space+d` - Show all diagnostics

---

## 🐍 Python Development

### Auto-formatting

- **Black** runs automatically on save for `.py` files

### Run Python File

- `Space+R` - Save and run current Python file

### Settings

- Tab width: 4 spaces
- Auto-indent enabled

---

## 📜 JavaScript/TypeScript Development

### Auto-formatting

- **Prettier** runs automatically on save for JS/TS files

### Run JavaScript File

- `Space+R` - Save and run current JS file with Node

### Settings

- Tab width: 2 spaces
- Auto-indent enabled

---

## 🎨 Theme & Appearance

### Active Theme

**Gruvbox Dark Hard** - Warm, retro-inspired color scheme

### Terminal Features

- TrueColor support (24-bit colors)
- Transparent background
- Nerd Font icons support
- Starship prompt

### Vim Transparency

All background elements are transparent to show terminal wallpaper

---

## 🔌 Installed Vim Plugins

**Theme:**

- Tokyo Night, Nord, Dracula, Gruvbox

**File Management:**

- NERDTree - File explorer
- FZF - Fuzzy finder
- vim-devicons - File icons

**Git:**

- vim-fugitive - Git commands
- vim-gitgutter - Git diff in gutter

**Code:**

- coc.nvim - Code completion & LSP
- nvim-treesitter - Syntax highlighting
- auto-pairs - Auto-close brackets
- vim-commentary - Easy commenting
- vim-surround - Surround text objects

**Formatting:**

- Prettier - JS/TS formatter
- Black - Python formatter

**Utilities:**

- vim-floaterm - Floating terminal
- indent-blankline - Indent guides
- which-key - Keybinding hints
- dashboard-nvim - Start screen

---

## 💡 Pro Tips

1. **Shift+Arrow Selection:** Use shift+arrows for text selection in terminal (zsh-shift-select plugin)
2. **Auto-suggestions:** Start typing and see suggestions from history (gray text)
3. **Quick Edit Configs:** Use the aliases (`vconf`, `zconf`, etc.) to quickly edit configs
4. **Terminal in Vim:** Use `Space+t` for a floating terminal without leaving Vim
5. **Visual Block Mode:** `Ctrl+V` in Vim for column selection
6. **Search in Files:** Use `Space+r` (Ripgrep) to search content across all files

---

## 📝 Notes

- Configuration uses **Space** as the leader key in Vim
- All configs support **TrueColor** for better color rendering
- **Completion waiting dots** enabled for better UX
- Auto-saves remove trailing whitespace
- Undo history persists between sessions

---

---

---

FUTURE TODO:

# 🚀 Recommended Neovim Plugins & Config Enhancements

## 📝 Markdown-Specific Plugins

### Essential for Markdown

**1. [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)** ⭐ Highly Recommended

```vim
Plug 'MeanderingProgrammer/render-markdown.nvim'
```

- **Why:** Beautiful inline rendering of Markdown in Neovim
- **Features:**
  - Renders headings with different colors/sizes
    - Renders code blocks with proper highlighting
      - Shows checkboxes as actual checkboxes ✓
        - Renders tables, quotes, and bullet points beautifully
          - Works in real-time as you type
          - **Setup:**

          ```vim
          " Add to your init.vim after plug#end()
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
          ```

          **2. [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)** ⭐ Essential

          ```vim
          Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
          ```

          - **Why:** Live preview in browser with auto-scroll sync
          - **Features:**
            - Real-time preview in your browser
              - Synchronized scrolling
                - Math support (LaTeX)
                  - Mermaid diagram support
                  - **Keybindings to add:**

                  ```vim
                  " Add to key mappings section
                  nnoremap <leader>mp :MarkdownPreview<CR>
                  nnoremap <leader>ms :MarkdownPreviewStop<CR>
                  nnoremap <leader>mt :MarkdownPreviewToggle<CR>
                  ```

                  **3. [markdown.nvim](https://github.com/tadmccorkle/markdown.nvim)** ⭐ Great for Editing

                  ```vim
                  Plug 'tadmccorkle/markdown.nvim'
                  ```

                  - **Why:** Powerful Markdown editing tools
                  - **Features:**
                    - Quick formatting (bold, italic, code, links)
                      - Table of contents generation
                        - Task list toggling
                          - Link navigation
                            - Smart list continuation
                            - **Keybindings to add:**
                            ```vim
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
                            ```

### Nice-to-Have Markdown Plugins

**4. [headlines.nvim](https://github.com/lukas-reineke/headlines.nvim)**

```vim
Plug 'lukas-reineke/headlines.nvim'
```

- Highlights headings with backgrounds
- Visual code block backgrounds
- Works great with Gruvbox

**5. [bullets.vim](https://github.com/dkarter/bullets.vim)**

```vim
Plug 'dkarter/bullets.vim'
```

- Auto-formatting for bullet lists
- Smart renumbering
- Checkbox toggling

---

## 🔧 General Quality-of-Life Plugins

### File Navigation & Management

**1. [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** ⭐ Superior to FZF

```vim
Plug 'nvim-lua/plenary.nvim'  " Required dependency
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
```

- **Why:** More powerful than FZF, better UI, extensible
- **Keybindings:**

```vim
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope oldfiles<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
```

**2. [harpoon](https://github.com/ThePrimeagen/harpoon)**

```vim
Plug 'ThePrimeagen/harpoon'
```

- Quick navigation between frequently used files
- Mark files and jump instantly
- Perfect for project work

**3. [oil.nvim](https://github.com/stevearc/oil.nvim)** - Alternative to NERDTree

```vim
Plug 'stevearc/oil.nvim'
```

- Edit your filesystem like a normal buffer
- More intuitive than traditional file explorers

### Code & Editing Enhancements

**4. [mini.nvim](https://github.com/echasnovski/mini.nvim)** ⭐ Swiss Army Knife

```vim
Plug 'echasnovski/mini.nvim'
```

- **Why:** Collection of 30+ independent modules
- **Recommended modules:**
  - `mini.pairs` - Better than auto-pairs
    - `mini.surround` - Better surround (vs, ys, ds)
      - `mini.ai` - Better text objects
        - `mini.comment` - Better commenting
          - `mini.move` - Move lines/selections (cleaner than your Alt+j/k)
            - `mini.bufremove` - Smart buffer deletion

            **5. [nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Better alternative

            ```vim
            Plug 'windwp/nvim-autopairs'
            ```

            - Superior to jiangmiao/auto-pairs
            - Better COC integration
            - More configuration options

            **6. [trouble.nvim](https://github.com/folke/trouble.nvim)**

            ```vim
            Plug 'folke/trouble.nvim'
            ```

            - Beautiful diagnostics panel
            - Better than COC's diagnostics list
            - Shows all errors/warnings in pretty format

            **7. [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)**

            ```vim
            Plug 'nvim-pack/nvim-spectre'
            ```

            - Find and replace across project
            - Better than `:s///` for large refactors

### UI & Visual Enhancements

**8. [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Alternative to Airline

```vim
Plug 'nvim-lualine/lualine.nvim'
```

- **Why:** Faster, more modern, highly customizable
- Lua-based (faster than Airline)
- Better integration with modern plugins

**9. [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)**

```vim
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
```

- Beautiful buffer/tab line
- Shows file icons, close buttons
- Better than Airline's tabline

**10. [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Better than gitgutter

```vim
Plug 'lewis6991/gitsigns.nvim'
```

- Superior to vim-gitgutter
- Async, faster, more features
- Inline blame, hunk staging

### Productivity

**11. [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)**

```vim
Plug 'folke/todo-comments.nvim'
```

- Highlights TODO, FIXME, NOTE, etc.
- Quick navigation to all todos
- Telescope integration

**12. [vim-visual-multi](https://github.com/mg979/vim-visual-multi)**

```vim
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
```

- Multiple cursors (like VSCode)
- `Ctrl+N` to add cursor at next match
- Game changer for editing

**13. [undotree](https://github.com/mbbill/undotree)**

```vim
Plug 'mbbill/undotree'
```

- Visualize undo history as a tree
- Never lose any change
- `<leader>u` to toggle

**14. [vim-surround](https://github.com/tpope/vim-surround)** - You already have this! ✓

- `ys` - Add surrounding
- `cs` - Change surrounding
- `ds` - Delete surrounding
- Example: `ysiw"` wraps word in quotes

---

## 📋 Recommended Config Updates

### Better Default Settings

Add these to your basic settings section:

```vim
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
```

### Better Keybindings to Add

```vim
" Quick escape from terminal mode
tnoremap <Esc><Esc> <C-\><C-n>

" Center screen after jumps
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Keep visual selection when indenting
vnoremap < <gv
vnoremap > >gv

" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Better paste (doesn't replace clipboard)
xnoremap <leader>p "_dP

" System clipboard shortcuts
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" Delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Quick save all
nnoremap <leader>W :wa<CR>

" Close all other buffers
nnoremap <leader>bo :BufferLineCloseOthers<CR>
```

### Markdown-Specific Autocmds

````vim
augroup Markdown
  autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_us
      autocmd FileType markdown setlocal wrap linebreak
        autocmd FileType markdown setlocal conceallevel=2
          autocmd FileType markdown nnoremap <buffer> <leader>mp :MarkdownPreview<CR>
            autocmd FileType markdown nnoremap <buffer> j gj
              autocmd FileType markdown nnoremap <buffer> k gk
                " Auto-save on leaving insert mode for notes
                  autocmd FileType markdown autocmd InsertLeave <buffer> silent! write
                  augroup END
                  ```

                  ---

## 🎯 Priority Installation Order

**Start with these (biggest impact):**

1. `render-markdown.nvim` - Makes MD editing beautiful
2. `markdown-preview.nvim` - Essential for previewing
3. `telescope.nvim` - Better file finding
4. `lualine.nvim` - Better statusline
5. `gitsigns.nvim` - Better git integration

**Then add these:**

6. `markdown.nvim` - Better MD editing tools
7. `bufferline.nvim` - Better buffer management
8. `trouble.nvim` - Better diagnostics
9. `todo-comments.nvim` - Productivity boost
10. `vim-visual-multi` - Multiple cursors

**Nice-to-have:**

11. `mini.nvim` modules
12. `harpoon` - File navigation
13. `undotree` - Undo visualization
14. `nvim-spectre` - Find & replace

---

## ⚡ Quick Setup Example

Here's a minimal addition to your `init.vim`:

```vim
" Add to your plug#begin() section:

" Markdown essentials
Plug 'MeanderingProgrammer/render-markdown.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'tadmccorkle/markdown.nvim'

" Better UI
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/trouble.nvim'

" Productivity
Plug 'mg979/vim-visual-multi'
Plug 'folke/todo-comments.nvim'

" Then after plug#end(), add:
lua << EOF
-- Lualine (replaces airline)
require('lualine').setup({
      options = {
              theme = 'gruvbox',
                  icons_enabled = true,
                    }
})

-- Gitsigns (replaces gitgutter)
require('gitsigns').setup()

-- Bufferline
require('bufferline').setup({
      options = {
              mode = 'buffers',
                  separator_style = 'slant',
                      always_show_bufferline = true,
                        }
})

-- Render Markdown
require('render-markdown').setup({
      enabled = true,
})

-- Markdown tools
require('markdown').setup()

-- Todo Comments
require('todo-comments').setup()

-- Trouble
require('trouble').setup()
EOF
````

---

## 🔍 Alternative Considerations

### If you want a complete Markdown experience like Obsidian:

**[obsidian.nvim](https://github.com/epwalsh/obsidian.nvim)**

- Full Obsidian vault integration
- Wiki links, daily notes, templates
- Search and navigation
- Only if you use Obsidian workflow

### If you want AI assistance:

**[copilot.vim](https://github.com/github/copilot.vim)**

```vim
Plug 'github/copilot.vim'
```

- GitHub Copilot integration
- Code suggestions as you type

---

## 🎨 Bonus: Improve Your Gruvbox Colors

Add after your colorscheme:

```vim
" Better Markdown colors with Gruvbox
highlight! link @markup.heading.1.markdown GruvboxRedBold
highlight! link @markup.heading.2.markdown GruvboxOrangeBold
highlight! link @markup.heading.3.markdown GruvboxYellowBold
highlight! link @markup.heading.4.markdown GruvboxGreenBold
highlight! link @markup.heading.5.markdown GruvboxAquaBold
highlight! link @markup.heading.6.markdown GruvboxBlueBold
```
