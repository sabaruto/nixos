{ lib, config, ... }:

with lib;

let cfg = config.localModules;
in {
  imports = [
    # options
    ./options.nix

    # cli
    ./zsh/home.nix
    ./git/home.nix

    # terminal
    ./kitty/home.nix
    ./tmux/home.nix

    # text editors
    ./micro/home.nix
    ./emacs/home.nix

    # language specific
    ./nix/home.nix
  ];

  config.localModules.apps = mkIf cfg.development.enable {
    zsh.enable = true;
    tmux.enable = true;
    micro.enable = true;
    emacs.enable = true;
    git.enable = true;
    kitty.enable = true;

    # golang.enable = (elem "golang" cfg.development.languages);
    # typescript.enable = (elem "typescript" cfg.development.languages);
    nix.enable = (elem "nix" cfg.development.languages);
  };
}
