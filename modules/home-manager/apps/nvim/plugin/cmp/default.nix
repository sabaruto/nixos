{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.nvim;
in
{
  options.localModules.apps.nvim.cmp.enable = mkEnableOption "cmp";

  config.programs.nixvim.plugins.cmp = mkIf cfg.cmp.enable {
    enable = true;
    autoEnableSources = true;
    settings = {
      preselect = "cmp.PreselectMode.None";

      mapping = {
        "<C-Down>" = "cmp.mapping.scroll_docs(-4)";
        "<C-Up>" = "cmp.mapping.scroll_docs(4)";

        "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";

        "<Esc>" = "cmp.mapping.abort()";
        "<Right>" = "cmp.mapping.confirm({ select = false })";
        "<CR>" = "cmp.mapping.confirm({ select = false })";

        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      };

      sources = [
        { name = "nvim_lsp"; }
        { name = "nvim_lsp_document_symbol"; }
        { name = "nvim_lsp_signature_help"; }

        { name = "dictionary"; }

        { name = "path"; }
        { name = "buffer"; }
        { name = "git"; }
        { name = "vimwiki"; }
      ];
    };
  };
}
