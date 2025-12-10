# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# ---- "cl" to clear ----
alias cl='clear'

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ---- Eza (better ls) -----
alias ls="eza --icons=always"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"

# ---- Always show Dotfiles with ls ----
alias ls='ls -a'

# ---- Alias for dotfiles repo ---- 
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# ---- Lazygit with custom config location ----
alias lazygit='command lazygit --use-config-file=$HOME/.config/lazygit/config.yml'

# ---- Alias for opening dotfiles in LazyGit ----
alias lgdot='command lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME --use-config-file=$HOME/.config/lazygit/config.yml'

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$HOME/.local/bin:$PATH"
eval "$(fnm env --use-on-cd --shell zsh)"
