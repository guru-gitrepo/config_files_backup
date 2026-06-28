# .bashrc
# Enable coloured ls output
if command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
fi

source ~/.aliases
export PS1="\w $:"
export EDITOR=vim
export PDK_ROOT="/usr/local/share/pdk"
