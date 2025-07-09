{ lib, config, pkgs, inputs, home-manager-modules, ... }: {
  security.pki.certificateFiles =
    [ "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt" ];

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
        inputs.local-packages.packages."x86_64-linux".kulala-ls
      ];

      config.localModules = {
        shells.zsh.enable = true;

        cmd = {
          direnv.enable = true;
          oh-my-posh.enable = true;
        };

        apps = {
          neovim.enable = true;
          tmux.enable = true;
          wezterm.enable = true;
          ghostty.enable = true;
          alacritty.enable = true;

          git = {
            enable = true;
            user = "teya";
          };
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

  programs.zsh.enable = true;
  users = { defaultUserShell = pkgs.zsh; };

}
