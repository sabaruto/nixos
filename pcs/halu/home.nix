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
      postman
      dconf-editor
      gnome-menus
      outputs.packages."x86_64-linux".kulala-ls
    ];

    config = {
      cmd = {
        direnv.enable = true;
        oh-my-posh.enable = true;
      };

      lib = {
        links = [
          {
            sourcePath =
              "/home/t-aaronobelley/nixos/pcs/halu/dotfiles/.composer/auth.json";
            symbolicLink = "/home/t-aaronobelley/.composer/";
          }
          {
            sourcePath =
              "/home/t-aaronobelley/nixos/pcs/halu/dotfiles/.wezterm.lua";
            symbolicLink = "/mnt/c/Users/TheodosiaAaron-Obell/.wezterm.lua";
          }
        ];
      };

      apps = {
        neovim.enable = true;
        tmux.enable = true;

        git = {
          enable = true;
          user = "teya";
        };
      };
    };
  };
}
