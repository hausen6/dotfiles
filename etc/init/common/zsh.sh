#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/lib/utils.sh


if has "zsh"; then
	log_echo "already installed zsh"
fi

if ! has "zsh"; then

    # Install zsh
	if has "brew"; then
		log_echo "Install zsh with Homebrew"
		brew install zsh
	elif "port"; then
		log_echo "Install zsh with MacPorts"
		sudo port install zsh-devel
	# Case of Linux
	elif has "yum"; then
		log_echo "Install zsh with Yellowdog Updater Modified"
		sudo yum -y install zsh
	elif has "apt-get"; then
		log_echo "Install zsh with Advanced Packaging Tool"
		sudo apt-get -y install zsh
	else
		log_fail "error: require: Homebrew, MacPots YUM or APT"
		exit 1
	fi

	# Other platforms such as BSD are supported
	log_fail "error: this script is only supported osx and linux"
	exit 1
fi

# Run the forced termination with a last exit code
exit $?

# Assign zsh as a login shell
if ! contains "${SHELL:-}" "zsh"; then
    zsh_path="$(which zsh)"

    # Check /etc/shells
    if ! grep -xq "${zsh_path:=/bin/zsh}" /etc/shells; then
        log_fail "oh, you should append '$zsh_path' to /etc/shells"
        exit 1
    fi

    if [ -x "$zsh_path" ]; then
        # Changing for a general user
        if chsh -s "$zsh_path" "${USER:-root}"; then
            log_pass "Change shell to $zsh_path for ${USER:-root} successfully"
        else
            log_fail "cannot set '$path' as \$SHELL"
            log_fail "Is '$path' described in /etc/shells?"
            log_fail "you should run 'chsh -l' now"
            exit 1
        fi

        # For root user
        if [ ${EUID:-${UID}} = 0 ]; then
            if chsh -s "$zsh_path" && :; then
                log_pass "[root] change shell to $zsh_path successfully"
            fi
        fi
    else
        log_fail "$zsh_path: invalid path"
        exit 1
    fi
fi
