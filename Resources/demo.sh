#!/usr/bin/env bash
# Loop: 300 baud on ttyUSB0, print syllabus, wait, clear screen, repeat.

TTY=/dev/ttyUSB0
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SYLLABUS="$HERE/monk_syllabus.txt"
COWSAY="$HERE/cowsay.txt"

while true; do
	# Clear
	printf '\033[2J\033[H' >"$TTY"
	# Set baud rate, etc.
	stty -F "$TTY" 300 cs8 -cstopb -parenb
	# Print syllabus to terminal
	cat "$SYLLABUS" | tee "$TTY"
	# Print cowsay to terminal
	cat "$COWSAY" | tee "$TTY"
	# Wait 1 second
	sleep 15
done
