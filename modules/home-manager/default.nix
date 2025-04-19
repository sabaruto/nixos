{ ... }:
{
  imports = [
    ./apps
    ./cmd
  ];

  config = {
    home.file.".config" = {
      source = ./config;
      recursive = true;
    };
  };
}
