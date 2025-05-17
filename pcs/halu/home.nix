{ config, pkgs, outputs, ... }: {
  imports = [ outputs.homeManagerModules.default ];

  localModules.home-manager = {
    enable = true;
    username = "t-aaronobelley";

    packages = with pkgs; [
      kubectl
      kind
      ctlptl
      helm
      tilt
      ghostty
      dconf-editor
      gnome-menus
    ];

    config = {
      cmd = { direnv.enable = true; };

      lib = {
        links = [{
          sourcePath =
            "/home/t-aaronobelley/nixos/pcs/halu/dotfiles/.composer/auth.json";
          symbolicLink = "/home/t-aaronobelley/.composer/";
        }];
      };

      apps = {
        neovim.enable = true;

        git = {
          enable = true;
          user = "teya";
        };
      };
    };
  };
}
