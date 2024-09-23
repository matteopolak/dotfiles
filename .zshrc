export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="af-minimal"

# add john the ripper alias to ~/crack/JohnTheRipper/run/john
alias john="JOHN=~/crack/JohnTheRipper/run ~/crack/JohnTheRipper/run/john"

# https://github.com/vercel/hyper/issues/2144#issuecomment-326741620
unsetopt PROMPT_SP

# export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

plugins=(git docker)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-defer/zsh-defer.plugin.zsh

# these are slow to load
defer_plugins=(zsh-autosuggestions zsh-nvm) # zsh-autocomplete)

for plugin ($defer_plugins); do
  zsh-defer source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
done

. "$HOME/.cargo/env"

export GPG_TTY=$(tty)
export PATH="$PATH:/usr/local/go/bin"

# bun completions
[ -s "/home/mat/.bun/_bun" ] && source "/home/mat/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# deno
export DENO_INSTALL="/home/mat/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/mat/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# .local/bin
export PATH="$PATH:/home/mat/.local/bin"

# opam configuration
[[ ! -r /home/mat/.opam/opam-init/init.zsh ]] || source /home/mat/.opam/opam-init/init.zsh > /dev/null 2> /dev/null
