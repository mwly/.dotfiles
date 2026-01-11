# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

export EDITOR=/usr/bin/nvim

export PATH=~/go/bin:$PATH
export PATH=~/.config/scripts:$PATH
export PATH=~/.local/bin:$PATH




# LASTLY start starship with zsh
 
eval "$(starship init zsh)" 
