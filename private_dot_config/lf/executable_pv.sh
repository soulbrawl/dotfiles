#!/bin/sh

# image preview using sixel with chafa
case "$(file -Lb --mime-type -- "$1")" in
image/*)
	chafa -f sixel -s "$2x$3" --animate false "$1"
	exit 1
	;;
esac

# file preview in general -- template from docs
case "$1" in
*.tar*) tar tf "$1" ;;
*.zip) unzip -l "$1" ;;
*.rar) unrar l "$1" ;;
*.7z) 7z l "$1" ;;
*.pdf) zathura "$1" - ;;
*) bat --plain --number --terminal-width $(($2 - 5)) -f "$1" || true ;;
esac
