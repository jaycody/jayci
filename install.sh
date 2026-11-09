#!/bin/zsh
#---------------------------------------------------------------
# >>>  install.sh  <<<
#---------------------------------------------------------------
# One command to set up a Mac with my jayci preferences.
# (added 2026-11-09 -- replaces doing README setup steps 2-6 by hand)
#
#   cd ~/jaycode/jayci
#   ./install.sh             # do it
#   ./install.sh --dry-run   # just show what it would do
#
# Safe to rerun. Anything already in the way gets backed up to
# <file>.pre-jayci-<date>, never deleted.
#
# Lives at the repo root (not scripts/) because jayci.cfg sources
# every scripts/*.sh at shell startup.
#---------------------------------------------------------------

JAYCI="${0:A:h}"                       # this repo, wherever it's cloned
STAMP=$(date +%Y%m%d-%H%M%S)
DRY=""
[[ "$1" == "--dry-run" ]] && DRY="yes"

jayci_say () { printf "\e[7;34m jayci install \e[0m %s\n" "$1"; }
run () { if [[ -n "$DRY" ]]; then echo "   (dry run) $*"; else "$@"; fi; }


#---------------------------------------------------------------
#   >>>  [1] symlink configs into place  <<<
#---------------------------------------------------------------
# link <file in repo> <where the system expects it>
link () {
    local SRC="$JAYCI/$1" DEST="$2"

    if [[ "$(readlink "$DEST")" == "$SRC" ]]; then
        echo "   ok       $DEST -> already linked"
        return
    fi
    if [[ -e "$DEST" || -L "$DEST" ]]; then
        echo "   backup   $DEST -> $DEST.pre-jayci-$STAMP"
        run mv "$DEST" "$DEST.pre-jayci-$STAMP"
    fi
    run mkdir -p "${DEST:h}"
    echo "   link     $DEST -> $SRC"
    run ln -s "$SRC" "$DEST"
}

jayci_say "[1] linking configs"
link .zshrc            "$HOME/.zshrc"
link .jayrc            "$HOME/.jayrc"
link .vimrc            "$HOME/.vim/vimrc"
link configs/htoprc    "$HOME/.config/htop/htoprc"
echo ""


#---------------------------------------------------------------
#   >>>  [2] Homebrew + tools  <<<
#---------------------------------------------------------------
jayci_say "[2] Homebrew tools (Brewfile)"
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    run brew bundle --file="$JAYCI/Brewfile"
else
    echo "   Homebrew isn't installed. It needs your password, so run this, then rerun ./install.sh:"
    echo '   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
fi
echo ""


#---------------------------------------------------------------
#   >>>  [3] vim colorscheme (Tomorrow-Night)  <<<
#---------------------------------------------------------------
jayci_say "[3] vim colorscheme"
THEME="$HOME/.vim/colors/Tomorrow-Night.vim"
if [[ -f "$THEME" ]]; then
    echo "   ok       $THEME already there"
else
    # From the original Tomorrow theme (Chris Kempson). The README's old
    # source, Ardakilic/vim-tomorrow-night-theme, is gone (404 as of 2026-11-09).
    URL="https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night.vim"
    if [[ -n "$DRY" ]]; then
        echo "   (dry run) download Tomorrow-Night.vim to $THEME"
    elif mkdir -p "${THEME:h}" && curl -fsSL "$URL" -o "$THEME"; then
        echo "   added    $THEME"
    else
        rm -f "$THEME"
        echo "   couldn't download the theme; vim still works without it"
    fi
fi
echo ""


#---------------------------------------------------------------
#   >>>  [4] Finder: show me everything  <<<
#---------------------------------------------------------------
# (added 2026-11-09)  Toggle dot files any time: Cmd + Shift + .
jayci_say "[4] Finder preferences"
run defaults write com.apple.finder AppleShowAllFiles -bool true        # hidden/dot files
run defaults write NSGlobalDomain AppleShowAllExtensions -bool true     # every file extension
run defaults write com.apple.finder ShowPathbar -bool true              # path bar at the bottom
run defaults write com.apple.finder ShowStatusBar -bool true            # item count + free space
run killall Finder                                                      # restart Finder to apply
echo "   ok       hidden files, extensions, path bar, status bar"
echo ""


jayci_say "done. Open a new terminal (or: exec zsh) to load it."
