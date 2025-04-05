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
  options.localModules.apps.nvim.telescope.enable = mkEnableOption "telescope";

  config.programs.nixvim.plugins.telescope = mkIf cfg.telescope.enable {
    enable = true;

    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };

    settings.pickers = mkMerge [
      (genAttrs
        [
          "find_files"
          "git_files"
          "grep_string"
          "live_grep"
          "registers"
          "buffers"
          "current_buffer_fuzzy_find"
          "projects"
          "lsp_definitions"
          "lsp_implementations"
          "lsp_references"
          "lsp_type_references"
          "lsp_document_symbols"
          "lsp_workspace_symbols"
          "projects"
        ]
        (name: {
          theme = "dropdown";
        })
      )

      (genAttrs [ "diagnostics" ] (name: {
        theme = "cursor";
      }))
    ];

    luaConfig.post = readFile ./keymaps.lua;
  };
}
