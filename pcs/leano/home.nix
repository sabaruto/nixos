{ pkgs, outputs, ... }:

{
  imports = [ outputs.homeManagerModules.default ];

  localModules.home-manager = {
    enable = true;
    username = "dosia";

    packages = with pkgs; [
      # browsers
      firefox

      # Vivaldi with forceful qt app wrapping
      (vivaldi.overrideAttrs (oldAttrs: {
        dontWrapQtApps = false;
        dontPatchELF = true;
        nativeBuildInputs = oldAttrs.nativeBuildInputs
          ++ [ kdePackages.wrapQtAppsHook ];
      }))

      # zoom
      zoom-us

      # cursors
      google-cursor

      # boot configuration
      efibootmgr
    ];

    config = {
      cmd = { direnv.enable = true; };

      apps = {
        git.enable = true;
        neovim.enable = true;
      };

      development = {
        enable = true;
        installOnNixos = true;
        languages = [ "nix" "lua" "java" "golang" "typescript" ];
      };
    };
  };
}
