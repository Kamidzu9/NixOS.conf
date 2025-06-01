{
  home.file.".zshrc".text = ''
    export HISTFILE="$HOME/.zsh_history"
    HISTSIZE=10000
    SAVEHIST=10000
    bindkey "^[[1;5C" forward-word
    bindkey "^[[1;5D" backward-word
    bindkey "^[[1;5A" up-line-or-history
    bindkey "^[[1;5B" down-line-or-history
    bindkey '^H' backward-kill-word
    bindkey '5~' kill-word
    eval "$(starship init zsh)"
  '';
}
