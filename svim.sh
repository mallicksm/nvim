#!/usr/bin/env bash
# XDG_CONFIG_HOME=$HOME/.config
# XDG_DATA_HOME=$HOME/.local/share
# XDG_CACHE_HOME=$HOME/.cache
#-------------------------------------------------------------------------------
set -eo pipefail

SVIM_CONFIG_DIR=$HOME/.config/svim
SVIM_RUNTIME_DIR=$HOME/.local/share/svim
SVIM_CACHE_DIR=$HOME/.cache/nvim

SVIM_SHIM="\
#!/bin/sh
export SVIM_RUNTIME_DIR=$SVIM_RUNTIME_DIR
exec nvim -u \"\$SVIM_RUNTIME_DIR/git-svim/init.lua\" \"\$@\"
"
git_repo_local=$HOME/git_repo/svim
git_repo_remote=https://github.com/mallicksm/svim.git
git_repo=$git_repo_local

declare -a __svim_dirs=(
   "$SVIM_CONFIG_DIR"
   "$SVIM_RUNTIME_DIR"
   "$SVIM_CACHE_DIR"
)

function main() {
   print_logo
 
   for dir in "${__svim_dirs[@]}"; do
      [ -d "$dir" ] && rm -rf "$dir"
   done
 
   git clone $git_repo $SVIM_RUNTIME_DIR/git-svim
   svim=$HOME/.local/bin/svim
   echo "$SVIM_SHIM" > $svim;chmod +x $svim
}

# Helpers-----------------------------------------------------------------------
function print_logo() {
   cat <<'EOF'
               (_)          
    _____   ___ _ __ ___  
   / __\ \ / / | '_ ` _ \ 
   \__ \\ V /| | | | | | |
   |___/ \_/ |_|_| |_| |_|
  
EOF
}

main "$@"
