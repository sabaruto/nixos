{ config, pkgs, home-manager-modules, ... }: {
  imports = [ ./hardware-configuration.nix ];

  networking.firewall.allowedTCPPorts = [ 8384 ];
  virtualisation.docker.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users = {
      saiki = {
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGXQGV1A1ihzFNBlckZniHqqSvc+hMLWp/HJxU4y2q2s saiki@mini-pc"
        ];
      };

      rtorrent = {
        isSystemUser = true;
        group = "servarr";
      };

      sonarr = { uid = 274; };

      radarr = { uid = 275; };

      lidarr = { uid = 306; };

      mstream = {
        uid = 307;
        group = "servarr";
      };
    };

    groups = {
      servarr = {
        gid = 1001;

        members = [
          "jellyfin"
          "lidarr"
          "nzbget"
          "plex"
          "prowlarr"
          "radarr"
          "root"
          "sonarr"
          config.localModules.name
        ];
      };
    };
  };

  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
    ssh.startAgent = true;
  };

  services = {
    plex.enable = true;
    nzbget.enable = true;

    jellyfin = {
      enable = true;
      openFirewall = true;
      dataDir = "/data/jellyfin";
    };

    sonarr = {
      enable = true;

      settings = { server = { urlbase = "sonarr"; }; };
    };

    radarr = {
      enable = true;

      settings = { server = { urlbase = "radarr"; }; };
    };

    readarr = {
      enable = true;

      settings = { server = { urlbase = "readarr"; }; };
    };

    lidarr = {
      enable = true;

      settings = { server = { urlbase = "lidarr"; }; };
    };

    prowlarr = {
      enable = true;

      settings = { server = { urlbase = "prowlarr"; }; };
    };

    rtorrent = {
      enable = true;
      openFirewall = true;
      group = "servarr";
    };

    rutorrent = {
      enable = true;
      hostName = "localhost";
      group = "servarr";
    };

    deluge = {
      enable = true;
      group = "servarr";

      web = {
        enable = true;
        openFirewall = true;
      };
    };

    roon-server = {
      enable = true;
      group = "servarr";
      openFirewall = true;
    };

    flaresolverr = {
      enable = true;
      openFirewall = true;
    };

    tailscale = {
      openFirewall = true;
      useRoutingFeatures = "both";
      authKeyFile = "/home/${config.localModules.name}/etc/auth/tailscale_key";
    };
  };

  environment.systemPackages = with pkgs; [
    jellyfin-ffmpeg
    jellyfin-web
    qbittorrent
    qbittorrent-cli
    qbittorrent-nox
  ];

  localModules = {
    name = "saiki";
    hostname = "mini-pc";
    stateVersion = "25.11";
    desktopEnvironment = "none";
    swapSize = 8 * 1024;
    gpu = "none";

    home-manager = {
      enable = true;
      modules = home-manager-modules;
      username = config.localModules.name;

      packages = with pkgs; [
        docker
        docker-compose
        jellyfin
        rtorrent
        transmission_4
      ];

      config = {
        localModules = {
          development.enable = true;
          shells.zsh.enable = true;

          cmd = {
            direnv.enable = true;
            oh-my-posh.enable = true;
            tmux.enable = true;
            git.enable = true;
          };

          apps = { neovim.enable = true; };

        };
      };
    };
  };
}
