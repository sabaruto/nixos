{ lib, config, pkgs, inputs, home-manager-modules, ... }: {
  security.pki.certificateFiles = [
    "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
    /etc/ssl/certs/SaltPay_Root_CA_01.pem
  ];

  services.syncthing.enable = lib.mkForce false;

  localModules = {
    name = "t-aaronobelley";
    hostname = "halu";
    stateVersion = "24.11";

    desktopEnvironment = "none";

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
        inputs.local-packages.packages."x86_64-linux".kulala-ls
      ];

      config.localModules = {
        cmd = {
          direnv.enable = true;
          oh-my-posh.enable = true;
        };

        apps = {
          neovim.enable = true;
          tmux.enable = true;
          ghostty.enable = true;

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
