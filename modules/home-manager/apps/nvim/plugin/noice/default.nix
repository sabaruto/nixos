{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.nvim;
in
{
  options.localModules.apps.nvim.noice.enable = mkEnableOption "noice";

  config.programs.nixvim.plugins.noice = mkIf cfg.noice.enable {
    enable = true;

    settings = {
      preset = {
        command_palette = true;
        inc_rename = true;
        lsp_doc_border = true;
      };

      lsp = {
        signature.view = "hover";

        override = {
          "cmp.entry.get_documentation" = true;
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
        };
      };
    };
  };
}
