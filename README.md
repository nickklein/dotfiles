# dotfiles

Personal Linux dotfiles: Neovim (LazyVim-based), tmux, bash, git, mycli, rmpc.

## Install

```bash
git clone https://github.com/nickklein/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` symlinks each config into `$HOME` after prompting. It does not install dependencies — see below.

## Requirements

### Core
- `git`
- `bash`
- `curl`
- `tmux` (>= 3.x)

### Neovim
- `nvim` (>= 0.10, currently using 0.12.x). Install the prebuilt tarball:
  ```bash
  curl -fsSL -o /tmp/nvim.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  sudo tar -C /opt -xzf /tmp/nvim.tar.gz
  sudo mv /opt/nvim-linux-x86_64 /opt/nvim
  sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim
  ```
- `ripgrep` (`rg`) — telescope live grep
- `fd-find` (`fdfind`, symlink to `fd`) — LazyVim/snacks file finder
- `fzf` — telescope fzf-native
- `lazygit` — LazyVim git UI
- `cmake`, `gcc` — building telescope-fzf-native and treesitter parsers
- `node` (>= 18) — LSP servers below
- `python3` + `python3-pynvim` — python provider

### LSP servers (npm)
```bash
npm install -g @tailwindcss/language-server
npm install -g intelephense
npm install -g typescript typescript-language-server
npm install -g pyright
```

### Pico (Raspberry Pi Pico)
- `tio` — serial REPL, auto-reconnects when the Pico re-enumerates after a flash (`tio /dev/ttyACM0`)
- User must be in the `dialout` group: `sudo usermod -aG dialout $USER` (re-login required)

Library/package manager depends on the framework you're using on the device:
- **CircuitPython** (Adafruit firmware, `code.py`): `pip install circup` — manages Adafruit libraries on the device. File transfer is just `cp` to the `CIRCUITPY` USB mount.
- **MicroPython** (`main.py`): `pip install mpremote` — REPL, file transfer, and `mip` package install over serial.
- **C/C++** (Pico SDK): clone `pico-sdk` + install `cmake`, `gcc-arm-none-eabi`, `build-essential`. Flash by mounting the Pico in BOOTSEL mode and copying the `.uf2`.

### Package manager (Ubuntu/Debian apt)
Install most of the above in one shot:
```bash
sudo apt install -y \
  git curl tmux ripgrep fd-find fzf cmake build-essential \
  nodejs npm python3 python3-pynvim \
  tio \
  xsel xclip
# fd is named fdfind on Ubuntu — symlink for snacks/LazyVim
mkdir -p ~/.local/bin && ln -sf "$(which fdfind)" ~/.local/bin/fd

# lazygit (not in default apt repos — use the upstream release)
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
sudo install /tmp/lazygit /usr/local/bin
```

### Optional
- `rmpc` — MPD client (configured for `192.168.50.29:6600`). Install via snap: `sudo snap install rmpc`
- `mycli` — MySQL CLI with autocomplete
- `ffmpeg` — used by `scripts/extract-audio.sh`, `scripts/desktop-audio-recording.sh`
- `yt-dlp` — used by `scripts/ytdlp.sh`
- `docker`, `docker compose` — used by tmux session scripts (`chat.sh`, `backup.sh`, etc.)

## Layout

| Path        | Symlinked to                  |
|-------------|-------------------------------|
| `nvim2/`    | `~/.config/nvim`              |
| `git/gitconfig` | `~/.gitconfig`            |
| `tmux/tmux.conf` | `~/.tmux.conf`           |
| `bash/bashrc` | `~/.bashrc`                 |
| `bash/bash_aliases` | `~/.bash_aliases`     |
| `mycli/myclicnf` | `~/.my.cnf`              |
| `rmpc/`     | `~/.config/rmpc` (or snap path) |
