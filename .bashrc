cd() {
	builtin cd "$@"
	if [[ -e readme.md ]]; then
		clear
		echo -e "$(sed -e 's/`\(.*\)`/\\033[2m\1\\033[0m/g; s/###\(.*\)/\\033[95;4m\1\\033[0m/g; s/^#\(.*\)/\\033[95;1m\1\\033[0m/g; s/\[\(.*\)\]/\\033[94m\1\\033[0m/g' readme.md)"
	fi
}

export TERM="xterm-256color"
