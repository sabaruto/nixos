{ config, home, lib, pkgs, ... }:
{
  programs.micro = {
    enable = true;
    settings = {
      "aspell.lang" = "en-GB";
      "colorscheme" = "catppuccin-macchiato";
      "tabstospaces" = true;
    };
  };

  home.file = {
    ".config/micro/bindings.json".source = ./config/micro/bindings.json;
    ".config/micro/colorschemes/catppuccin-latte.micro".source = ./config/micro/colorschemes/catppuccin-latte.micro;
    ".config/micro/colorschemes/catppuccin-macchiato.micro".source = ./config/micro/colorschemes/catppuccin-macchiato.micro;
  };

  home.activation = {
    plugins = lib.hm.dag.entryAfter ["writeBoundary"] ''
        run ${pkgs.micro}/bin/micro -plugin install aspell
        run ${pkgs.micro}/bin/micro -plugin install autofmt
        run ${pkgs.micro}/bin/micro -plugin install filemanager
        run ${pkgs.micro}/bin/micro -plugin install go
        run ${pkgs.micro}/bin/micro -plugin install lsp
        run ${pkgs.micro}/bin/micro -plugin install quoter
        run ${pkgs.micro}/bin/micro -plugin update
      '';
  };
}
