#!/bin/bash
set -e

# Installation script for dotfiles using GNU Stow
if ! command -v stow &>/dev/null; then
	echo "Installing stow..."
	sudo apt update && sudo apt install -y stow
fi

# Move to the dotfiles directory
cd "$(dirname "$0")/.."
DOTFILES_DIR=$(pwd)

# Check and create ~/.gitconfig.local if it doesn't exist
if [ ! -f "$HOME/.gitconfig.local" ]; then
	echo "Creating ~/.gitconfig.local..."
	cat >"$HOME/.gitconfig.local" <<EOF
[user]
    name = Yugo Inutsuka (Auto Generated)
    email =
EOF
	echo "WARNING: Edit ~/.gitconfig.local to set your Git name and email!"
fi

# Backup existing configuration files
backup_if_exists() {
	local filename="$1"
	local target="$HOME/$filename"

	# Check if the file exists AND is NOT a symlink
	# (If it's already a symlink, stow will handle it or we want to overwrite it)
	if [ -e "$target" ] && [ ! -L "$target" ]; then
		echo "Found existing file: $filename"
		echo "  -> Backing up to $target.backup"
		mv "$target" "$target.backup"
	fi
}
echo "Checking for conflicting files..."
backup_if_exists ".bashrc"
backup_if_exists ".bash_profile"
backup_if_exists ".profile"
backup_if_exists ".gitconfig"
backup_if_exists ".inputrc"

# Use stow to create symlinks for bash and git configurations
# -v: verbose, -R: recursive (update links), -t: target ($HOME)
echo "Linking configuration files..."
stow -v -R -t "$HOME" bash
stow -v -R -t "$HOME" git

echo "Done!"
echo "Run 'source ~/.bashrc'"
