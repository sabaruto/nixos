{ pkgs, ... }: {
  imports = [ ./zsh ./fish ];
  environment.systemPackages = with pkgs; [ oh-my-posh ];
}
