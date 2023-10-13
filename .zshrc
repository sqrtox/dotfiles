export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-autosuggestions", as:plugin
zplug "zsh-users/zsh-syntax-highlighting", as:plugin
zplug "olets/zsh-abbr"
zplug "rupa/z", use:"*.sh"

if ! zplug check --verbose; then
  printf "インストールしますか？ [y/N]: "

  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

export HOMEBREW_CURL_PATH=/bin/curl
export HOMEBREW_GIT_PATH=/bin/git

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export DISPLAY=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0

export GDK_BACKEND=x11

eval "$(starship init zsh)"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
