{
  lib,
  config,
  pkgs,
  home-manager-modules,
  ...
}:
{

  security.pki.certificateFiles = [
    ../../secrets/SaltPay_Root_CA_01.pem
  ];

  services.syncthing.enable = lib.mkForce false;

  localModules = {
    name = "t-aaronobelley";
    hostname = "halu";
    stateVersion = "24.11";

    desktopEnvironment = "none";
    gpu = "nvidia";
    hostMachine = false;

    system.docker.enable = true;

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
        jwt-cli
        kulala-ls
        cspell-lsp
        yazi

        xdg-utils-cxx
        weston

        stylua
        bat
        postgresql
        k6

        cacert

        mongodb-cli
        mongosh

        #wsl
        wsl-open
        wslu
        wsl-vpnkit
        xsel
      ];

      config.localModules = {
        shells.zsh.enable = true;

        development = {
          enable = true;
          installOnNixos = true;
          languages = [
            "nix"
            "lua"
            "java"
          ];
        };

        cmd.git = {
          enable = true;
          user = "t-aaronobelley";
        };

        apps.emanote.enable = false;
      };
    };
  };

  wsl = {
    enable = true;
    defaultUser = "t-aaronobelley";

    wrapBinSh = true;

    # USB access
    usbip.enable = true;
    useWindowsDriver = true;
    startMenuLaunchers = true;
    docker-desktop.enable = false;

    interop.register = true;

    wslConf.user.default = "t-aaronobelley";
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    wlr.enable = true;
    lxqt.enable = true;

    configPackages = with pkgs; [
      gnome-session
      uwsm
    ];

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-hyprland
    ];

  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    SDL
    SDL2
    SDL2_image
    SDL2_mixer
    SDL2_ttf
    SDL_image
    SDL_mixer
    SDL_ttf
    alsa-lib
    at-spi2-atk
    at-spi2-core
    atk
    bzip2
    cairo
    cups
    curlWithGnuTls
    dbus
    dbus-glib
    desktop-file-utils
    e2fsprogs
    expat
    flac
    fontconfig
    freeglut
    freetype
    fribidi
    fuse
    fuse3
    gdk-pixbuf
    glew110
    glib
    gmp
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-ugly
    gst_all_1.gstreamer
    gtk2
    harfbuzz
    icu
    keyutils.lib
    libGL
    libGLU
    libappindicator-gtk2
    libcaca
    libcanberra
    libcap
    libclang.lib
    libdbusmenu
    libdrm
    libgcrypt
    libgpg-error
    libidn
    libjack2
    libjpeg
    libmikmod
    libogg
    libpng12
    libpulseaudio
    librsvg
    libsamplerate
    libthai
    libtheora
    libtiff
    libudev0-shim
    libusb1
    libuuid
    libvdpau
    libvorbis
    libvpx
    libxcrypt-legacy
    libxkbcommon
    libxml2
    mesa
    nspr
    nss
    openssl
    p11-kit
    pango
    pixman
    python3
    speex
    stdenv.cc.cc
    tbb
    udev
    vulkan-loader
    wayland
    xorg.libICE
    xorg.libSM
    xorg.libX11
    xorg.libXScrnSaver
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXft
    xorg.libXi
    xorg.libXinerama
    xorg.libXmu
    xorg.libXrandr
    xorg.libXrender
    xorg.libXt
    xorg.libXtst
    xorg.libXxf86vm
    xorg.libpciaccess
    xorg.libxcb
    xorg.xcbutil
    xorg.xcbutilimage
    xorg.xcbutilkeysyms
    xorg.xcbutilrenderutil
    xorg.xcbutilwm
    xorg.xkeyboardconfig
    xz
    zlib
  ];

  programs.zsh.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  users = {
    defaultUserShell = pkgs.zsh;
  };
}
