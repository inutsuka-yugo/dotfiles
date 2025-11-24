#!/bin/bash
set -e

# ==============================================================================
# CONFIGURATION: WINDOWS USER DETECTION
# ==============================================================================

# Get Windows username via cmd.exe
# 1. cmd.exe /c 'echo %USERNAME%': Ask Windows for the username
# 2. tr -d '\r': Remove Windows carriage return (\r) to avoid path errors
WIN_USER=$(cmd.exe /c 'echo %USERNAME%' 2>/dev/null | tr -d '\r')

# Fallback: If command fails (not WSL?), use Linux user
if [ -z "$WIN_USER" ]; then
	WIN_USER=$(whoami)
fi

# ==============================================================================
# CONFIGURATION: CANDIDATE PATHS
# ==============================================================================

# List of potential source paths (Windows side).
# The script will use the FIRST path that actually exists.
# You can add as many paths as you want for different PCs.
POSSIBLE_SOURCES=(
	"/mnt/d/WSL_Data"                             # New laptop (D Drive)
	"/mnt/c/Users/${WIN_USER}/Documents/WSL_Data" # Old laptop (C Drive)
)

# Default destination path (WSL side).
# Usually standard across environments, but you can change it here.
DEFAULT_DEST="$HOME/data"

# ==============================================================================
# LOGIC
# ==============================================================================

# 1. Determine SOURCE
# If an argument is provided, use it. Otherwise, auto-detect from candidates.
if [ -n "$1" ]; then
	SOURCE="$1"
else
	SOURCE=""
	for path in "${POSSIBLE_SOURCES[@]}"; do
		if [ -d "$path" ]; then
			SOURCE="$path"
			break
		fi
	done
fi

# 2. Determine DESTINATION
# If a second argument is provided, use it. Otherwise, use default.
if [ -n "$2" ]; then
	DEST="$2"
else
	DEST="$DEFAULT_DEST"
fi

# ==============================================================================
# VALIDATION & EXECUTION
# ==============================================================================

# Check if Source exists
if [ -z "$SOURCE" ] || [ ! -d "$SOURCE" ]; then
	echo "Error: No valid source directory found."
	echo "Checked candidates: ${POSSIBLE_SOURCES[*]}"
	exit 1
fi

# Create Destination if it doesn't exist
if [ ! -d "$DEST" ]; then
	echo "Creating destination directory: $DEST"
	mkdir -p "$DEST"
fi

echo "--------------------------------------------------"
echo "Syncing Data..."
echo "  FROM: $SOURCE"
echo "  TO:   $DEST"
echo "--------------------------------------------------"

# Run rsync
# -a: archive mode (preserves permissions, times, etc.)
# -v: verbose
# --update: skip files that are newer on the receiver
rsync -av --update "$SOURCE/" "$DEST/"

echo "--------------------------------------------------"
echo "Sync completed successfully."
