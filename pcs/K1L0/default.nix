{
  config,
  home-manager-modules,
  pkgs,
  ...
}:
{
  imports = [ ./hardware-configuration.nix ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware = {
    bluetooth.enable = true;
    keyboard.qmk.enable = true;
  };

  users = {
    defaultUserShell = pkgs.zsh;

    groups = {
      dialout = {
        members = [
          config.localModules.name
        ];
      };
    };
  };
  programs = {
    zsh.enable = true;
    yazi = {
      enable = true;
    };
  };

  services = {
    roon-server.enable = true;

    udev = {
      enable = true;
      packages = with pkgs; [ via ];
    };
  };

  localModules = {
    name = "dosia";
    hostname = "K1L0";
    stateVersion = "25.05";

    swapSize = 32 * 1024;
    gpu = "nvidia";

    desktopEnvironment = "kde";

    apps.steam.enable = true;
    peripherals.kanata.enable = false;

    home-manager = {
      enable = true;
      modules = home-manager-modules;

      packages = with pkgs; [
        # Music with code
        kdePackages.k3b
        chromium

        roon-tui
        krita
        wineWowPackages.full
        godot-mono
        uv

        via
        qmk

        # Arduino
        arduino-ide
        arduino-core

        devenv
      ];

      config.localModules = {
        shells = {
          zsh.enable = true;
          fish.enable = true;
        };

        cmd = {
          direnv.enable = true;
          git.enable = true;
          oh-my-posh.enable = false;
          tmux.enable = true;
        };

        apps = {
          alacritty.enable = true;
          ghostty.enable = true;
          helix.enable = true;
          kitty.enable = true;
          neovim.enable = true;
          wezterm.enable = true;
          zed.enable = true;
          zen-browser.enable = true;
        };

        development = {
          enable = true;
          installOnNixos = true;

          languages = [
            "nix"
            "lua"
            "sass"
            "java"
            "golang"
            "typescript"
          ];
        };

        cronjobs.theme-switching.enable = true;
      };
    };
  };
}
