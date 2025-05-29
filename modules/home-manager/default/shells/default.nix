{ pkgs, ... }: {
  imports = [ ./zsh ./fish ];
  home.packages = with pkgs; [ oh-my-posh ];
}
