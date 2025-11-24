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
