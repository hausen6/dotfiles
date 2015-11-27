#!/bin/bash

trap 'echo ERROR: $0:$LINENO stopeed; exit 1' SIGINT SIGTERM
set -eu

. "$DOTPATH"/etc/lib/utils.sh

if [ $# -ne 1 ]; then
	log_fail "ERROR: please specify Platform [osx/linux]"
	exit 1
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp
#             until this script has finished
while true
do
    sudo -n true
    sleep 60;
    kill -0 "$$" || exit
done 2>/dev/null &

# shellcheck disable=SC2102
for i in "$DOTPATH"/etc/init/"$1"/*.sh
do
	log_info $i
    if [ -f "$i" ]; then
        # log_info "$(e_arrow "$(basename "$i")")"
        if [ "${DEBUG:-}" != 1 ]; then
            bash "$i"
        fi
    else
        continue
    fi
done

log_pass "$0: Finish!!" | sed "s $DOTPATH \$DOTPATH g"
