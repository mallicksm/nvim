#!/usr/bin/env bash
#-------------------------------------------------------------------------------
set -eo pipefail

git_repo_local=$HOME/git_repo/nvim
git_repo_remote=https://github.com/mallicksm/nvim.git
git_repo=$git_repo_local

function main() {
   print_logo
   rm -rf $HOME/.config/nvim
   rm -rf $HOME/.local/share/nvim
   git clone $git_repo $HOME/.config/nvim
}

# Helpers-----------------------------------------------------------------------
function print_logo() {
   cat <<'EOF'
      ███╗   ██╗██╗   ██╗██╗███╗   ███╗
      ████╗  ██║██║   ██║██║████╗ ████║
      ██╔██╗ ██║██║   ██║██║██╔████╔██║
      ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
      ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
      ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
EOF
}

main "$@"
