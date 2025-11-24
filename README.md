# dotfiles

inutsuka-yugo's dotfiles for **WSL 2** development environments.
Managed with [GNU Stow](https://www.gnu.org/software/stow/) to keep the home directory clean.

## Installation

### 1. Clone Repository at $HOME

```bash
cd ~
git clone https://github.com/inutsuka-yugo/dotfiles.git
```

### 2. Run Setup Script

Run the installer. This script installs `stow` (if missing) and creates necessary symlinks.

```bash
bash ~/dotfiles/scripts/install.sh
```

### 3. Configure Git Credentials

User name and email for Git are not included in the repository.
Add your details to the auto-generated local config in `~/.gitconfig.local`:

```ini
[user]
    name = Your Name
    email = your.email@example.com
```

### 4. Running .bashrc

Apply changes by restarting your shell or running:

```bash
source ~/.bashrc
```

## 💡 Other utilities

### sync_data

Sync specific folders from Windows to WSL using `rsync`.
To automatically detect the source drive (based on the `POSSIBLE_SOURCES` list in the script):

```bash
sync_data
```

If you want to sync a specific folder just once:

```Bash
# Usage: sync_data <Source> <Destination>
sync_data /mnt/f/TemporaryData ~/data/temp
```

## License

MIT
