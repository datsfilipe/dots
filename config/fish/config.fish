set fish_greeting ""
set -gx TERM xterm-256color
set -g theme_color_scheme terminal-dark

# bind CTRL + L to clear term
function fish_user_key_bindings
    bind \cl 'clear; commandline -f repaint'
end

# -----
# theme
# ----- 
# command to install: curl -fsSL https://starship.rs/install.sh | bash
starship init fish | source

# -------
# aliases
# -------
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

# ----
# asdf
# ----
source /opt/asdf-vm/asdf.fish

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
