{ lib, config, pkgs, ... }:
with lib;
let cfg = config.localModules;
in {
  options.localModules = {

  };

  config = {
    home.file."nvim" = mkIf cfg.apps.neovim.enable {
      enable = true;
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/github.com/sabaruto/nixos/nix/modules/dotfiles/nvim";
      target = ".config/nvim";
    };
  };
}
