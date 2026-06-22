# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls -F --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
else
	alias ls='ls -F' # -F for file type indication
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ls related aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsgit='git ls-files | while read file; do echo "$(git log -1 --format="%ad" --date=iso -- "$file") $file"; done | sort -r'

# Safe file operations
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Open current directory in Windows Explorer
alias win='explorer.exe .'

# Clipboard (Copy from WSL to Windows clipboard)
# Usage example: cat file.txt | clip
alias clip='clip.exe'

# Research / Data Synchronization
# You can pass arguments to override: sync_data [source] [dest]
alias sync_data='bash ~/dotfiles/scripts/sync_data.sh'

# Others
alias reload='source ~/.bashrc && echo "Bash config reloaded."'
alias ..='cd ..'
alias ...='cd ../..'
alias tensorboardhere='tensorboard --logdir .'


# NESRC
alias sallocG='salloc --nodes 1 --qos interactive --constraint gpu --gpus 4 --account m5179_g --time'
alias sallocG5m='salloc --nodes 1 --qos interactive --constraint gpu --gpus 4 --account m5179_g --time 00:05:00'
alias sallocG30m='salloc --nodes 1 --qos interactive --constraint gpu --gpus 4 --account m5179_g --time 00:30:00'
alias sallocG1h='salloc --nodes 1 --qos interactive --constraint gpu --gpus 4 --account m5179_g --time 01:00:00'
alias sallocG2h='salloc --nodes 1 --qos interactive --constraint gpu --gpus 4 --account m5179_g --time 02:00:00'
alias sallocC='salloc --nodes 1 --qos interactive --constraint cpu --account m5179 --time'
alias sallocC1h='salloc --nodes 1 --qos interactive --constraint cpu --account m5179 --time 01:00:00'

alias conda_aistudio='conda activate /pscratch/sd/i/inutsuka/conda_envs/aistudio/'

alias sbatch_all='bash /pscratch/sd/i/inutsuka/sbatch_all.sh'
alias analyze_all='bash /pscratch/sd/i/inutsuka/analyze_all.sh'
