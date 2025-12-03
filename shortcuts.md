# ⚡️ Kali Shortcuts ⚡️

This document serves as a quick reference for customized keybindings across my NeoVim, Kitty Terminal, and Zsh environment on Kali Linux.

---

#### 💻 Kitty Terminal Shortcuts

These shortcuts govern window splitting, navigation, and resizing _within_ the Kitty terminal application.

| Action                       | Keybinding                    | Context | Description                                                     |
| :--------------------------- | :---------------------------- | :------ | :-------------------------------------------------------------- |
| **New Vertical Split**       | `Ctrl + Shift + \`            | Window  | Split current pane vertically.                                  |
| **New Horizontal Split**     | `Ctrl + Shift + -`            | Window  | Split current pane horizontally.                                |
| **Navigate Panes (Focus)**   | `Ctrl + Shift + H/J/K/L`      | Window  | Switch focus between neighboring panes (Vim style).             |
| **Move Panes (Swap)**        | `Ctrl + Alt + Arrows`         | Window  | Swap the position of the active pane with a neighbor.           |
| **Resize Panes**             | `Ctrl + Shift + Alt + Arrows` | Window  | Make the active pane taller/shorter/wider/narrower.             |
| **Toggle Fullscreen (Pane)** | `Ctrl + Shift + Z`            | Layout  | Zoom the current pane to fill the entire window (Stack layout). |

| **Close Pane** | `Ctrl + Shift + W` | Window | Close the current active pane. |
| **Reset Pane Sizes** | `Ctrl + Shift + =` | Layout | Reset all panes in the current window to equal sizes. |
| **New Tab** | `Ctrl + Shift + T` | Tab | Create a new tab in the current working directory. |
| **Next/Previous Tab** | `Ctrl + Shift + ]` / `Ctrl + Shift + [` | Tab | Cycle through open tabs. |
| **Go To Tab (1-9)** | `Ctrl + Shift + 1-9` | Tab | Directly jump to a specific tab number. |
| **Close Tab** | `Ctrl + Shift + Q` | Tab | Close the current active tab. |
| **Rename Tab** | `Ctrl + Shift + Alt + T` | Tab | Set a custom title for the current tab. |
| **Clear Scrollback** | `Ctrl + Shift + Delete` | Output | Clear the entire terminal scrollback buffer. |
| **Open Scrollback in Editor** | `Ctrl + Shift + G` | Output | Open the scrollback buffer content in a text editor. |
| **Reload Config** | `Ctrl + Shift + F5` | Kitty | Reload `kitty.conf` without restarting Kitty. |

---

## 💾 Vim/NeoVim Shortcuts

The leader key is set to **`<Space>`**. All `<leader>` commands require hitting the **Spacebar** first.

| Action                     | Keybinding                            | Context              | Description                                                |
| :------------------------- | :------------------------------------ | :------------------- | :--------------------------------------------------------- |
| **Go To Definition**       | `gd`                                  | Normal               | Jump to the definition of the symbol under the cursor.     |
| **Global Search (Rg)**     | `<leader>r`                           | Normal               | Ripgrep search project files (`:Rg`).                      |
| **Find Files (FZF)**       | `<leader>p`                           | Normal               | Fuzzy find files in the project (`:Files`).                |
| **Toggle NERDTree**        | `<leader>e`                           | Normal               | Toggle the file explorer sidebar.                          |
| **Show Documentation**     | `K`                                   | Normal               | Show documentation hover (via CoC).                        |
| **Run Python File**        | `<leader>R`                           | `*.py` only          | Save file and run with `python3 %`.                        |
| **Run JS/TS File**         | `<leader>R`                           | `*.js,*.ts` only     | Save file and run with `node %`.                           |
| **Move Line Up/Down**      | `Alt + K` / `Alt + J`                 | Normal/Insert/Visual | Move the current line (or selection) up or down.           |
| **Copy Line Up/Down**      | `Alt + Shift + K` / `Alt + Shift + J` | Normal/Insert/Visual | Duplicate the current line above or below.                 |
| **Escape Insert Mode**     | `jk` or `kj`                          | Insert               | Fast exit from insert mode.                                |
| **Toggle Comment**         | `Ctrl + /`                            | Normal/Visual        | Toggle comment/uncomment the current line or selection.    |
| **System Copy**            | `Ctrl + c`                            | Visual               | Copy the visual selection to the system clipboard (`"+y`). |
| **System Paste**           | `Ctrl + v`                            | Normal/Visual/Insert | Paste from the system clipboard (`"+p`).                   |
| **Find in NERDTree**       | `<leader>f`                           | Normal               | Reveal the current file in the NERDTree file explorer.     |
| **Find Buffers (FZF)**     | `<leader>b`                           | Normal               | Fuzzy find open buffers (`:Buffers`).                      |
| **Save File**              | `<leader>w` or `Ctrl + s`             | Normal/Insert        | Save the current buffer.                                   |
| **Close Buffer**           | `<leader>bd`                          | Normal               | Delete the current buffer (`:bdelete`).                    |
| **Next/Previous Buffer**   | `Tab` / `Shift + Tab`                 | Normal               | Navigate to the next or previous buffer.                   |
| **Clear Search Highlight** | `<Esc><Esc>` or `<leader>h`           | Normal               | Clear search highlighting (`:nohlsearch`).                 |
| **Toggle Floaterm**        | `<leader>t`                           | Normal               | Open a new floating terminal window (`:FloatermNew`).      |
| **Markdown Preview**       | `<leader>mp`                          | Normal               | Start Markdown preview in the browser.                     |
| **Format Code**            | `<leader>F`                           | Normal/Visual        | Format code using CoC/Prettier/Black.                      |
| **Rename Symbol**          | `<leader>rn`                          | Normal               | Rename the symbol under the cursor (via CoC).              |

---

### 🐚 Zsh Aliases & Plugins

These commands are available directly in your Kitty terminal prompt.

## Zsh Aliases (Quick Commands)

| Alias                | Command                              | Description                                                        |
| :------------------- | :----------------------------------- | :----------------------------------------------------------------- |
| **`ll`**             | `ls -lah --color=auto`               | Human-readable, long listing of directory contents.                |
| **`v`** or **`vim`** | `nvim`                               | Launch Neovim.                                                     |
| **`serve`**          | `python3 -m http.server`             | Quickly launch a Python HTTP server in the current directory.      |
| **`nse`**            | `ls /usr/share/nmap/scripts \| grep` | Quickly search the Nmap script directory.                          |
| **`tun0`**           | `ip a show tun0 ...`                 | Get the IP address for the `tun0` interface (useful for VPNs/HTB). |
| **`myip`**           | `curl ifconfig.me`                   | Quickly show your public IP address.                               |
| **`notes`**          | `nvim ~/Documents/notes.md`          | Open your primary notes file in Neovim.                            |
| **`todo`**           | `nvim ~/Documents/todo.md`           | Open your todo list in Neovim.                                     |

## Configuration File Aliases

| Alias          | Configuration File                 | Description                         |
| :------------- | :--------------------------------- | :---------------------------------- |
| **`vconf`**    | `~/.config/nvim/init.vim`          | Edit Neovim configuration.          |
| **`zconf`**    | `~/.zshrc`                         | Edit Zsh shell configuration.       |
| **`kconf`**    | `~/.config/kitty/kitty.conf`       | Edit Kitty terminal configuration.  |
| **`starconf`** | `~/.config/starship.toml`          | Edit Starship prompt configuration. |
| **`fastconf`** | `~/.config/fastfetch/config.jsonc` | Edit Fastfetch configuration.       |

## Zsh Plugin Keybindings

| Action                      | Keybinding      | Plugin                | Description                                                                     |
| :-------------------------- | :-------------- | :-------------------- | :------------------------------------------------------------------------------ |
| **Autocomplete Suggestion** | `Right Arrow`   | `zsh-autosuggestions` | Accept the grayed-out suggestion from history.                                  |
| **History Reverse Search**  | `Ctrl + R`      | `fzf`                 | Interactive fuzzy search through command history.                               |
| **Fuzzy File Search**       | `Ctrl + T`      | `fzf`                 | Interactive fuzzy search for files/directories to insert into the command line. |
| **Shift Select**            | `Shift + Arrow` | `zsh-shift-select`    | Select text in the terminal buffer (requires `no_op` in Kitty).                 |
