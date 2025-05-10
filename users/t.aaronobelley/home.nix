{
  lib,
  pkgs,
  outputs,
  ...
}:

{
  imports = [ ../../modules/home-manager ];

  home = {
    username = "t.aaronobelley";
    homeDirectory = lib.mkDefault "/Users/t.aaronobelley";
    stateVersion = "24.11";
  };

  localModules = {
    apps = {
      neovim.enable = true;
    };

    development = {
      enable = true;

      languages = [
        "nix"
      ];
    };
  };
}
