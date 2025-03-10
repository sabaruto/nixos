{ lib, config, pkgs, ... }:

with lib;

let cfg = config.localModules.apps;
in {
  options.localModules.apps.micro.enable = mkEnableOption "micro";

  config = mkIf cfg.micro.enable {
    programs.micro = {
      enable = true;
      settings = {
        "aspell.lang" = "en-GB";
        "colorscheme" = "catppuccin-macchiato";
        "tabstospaces" = true;
      };
    };

    home.file = {
      ".config/micro/bindings.json".source = ./bindings.json;
      ".config/micro/colorschemes/catppuccin-latte.micro".source =
        ./colorschemes/catppuccin-latte.micro;
      ".config/micro/colorschemes/catppuccin-macchiato.micro".source =
        ./colorschemes/catppuccin-macchiato.micro;
    };

    home.activation = {
      plugins = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        run ${pkgs.micro}/bin/micro -plugin install aspell
        run ${pkgs.micro}/bin/micro -plugin install autofmt
        run ${pkgs.micro}/bin/micro -plugin install filemanager
        run ${pkgs.micro}/bin/micro -plugin install go
        run ${pkgs.micro}/bin/micro -plugin install lsp
        run ${pkgs.micro}/bin/micro -plugin install quoter
        run ${pkgs.micro}/bin/micro -plugin update
      '';
    };
  };
}
