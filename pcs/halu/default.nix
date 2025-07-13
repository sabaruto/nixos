{
  lib,
  config,
  pkgs,
  inputs,
  system,
  home-manager-modules,
  ...
}:
{
  security.pki.certificateFiles = [ "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt" ];

  services.syncthing.enable = lib.mkForce false;

  localModules = {
    name = "t-aaronobelley";
    hostname = "halu";
    stateVersion = "24.11";

    desktopEnvironment = "none";
    gpu = "nvidia";

    system.podman.enable = true;

    home-manager = {
      enable = true;
      username = "${config.localModules.name}";
      modules = home-manager-modules;

      packages = with pkgs; [
        kubectl
        kind
        ctlptl
        helm
        tilt
        postman
        dconf-editor
        gnome-menus
        jwt-cli
        inputs.agenix.packages."${system}".default
        inputs.local-packages.packages."${system}".kulala-ls
        inputs.local-packages.packages."${system}".java-debug
      ];

      config.localModules = {
        shells.zsh.enable = true;

        cmd = {
          tmux.enable = true;
          direnv.enable = true;
          oh-my-posh.enable = true;

          git = {
            enable = true;
            user = "teya";
          };
        };

        apps = {
          neovim.enable = true;
          wezterm.enable = true;
          ghostty.enable = true;
          alacritty.enable = true;

        };
      };
    };
  };

  wsl = {
    enable = true;
    defaultUser = "t-aaronobelley";

    # USB access
    usbip.enable = true;
    useWindowsDriver = true;
    startMenuLaunchers = true;
    docker-desktop.enable = true;
  };

  age = {
    secretsDir = "/home/t-aaronobelley/agenix";
    identityPaths = [ "/etc/ssh/id_ed25519" ];

    secrets = {
      "SaltPay_Root_CA_01.pem" = {
        file = ../../secrets/SaltPay_Root_CA.age;
      };
    };
  };

  programs.zsh.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  users = {
    defaultUserShell = pkgs.zsh;
  };
}
