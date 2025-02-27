{ pkgs, ... }: 

pkgs.appimageTools.wrapType2 {
  pname = "zen";
  version = "1.7.6b";

  src = pkgs.fetchurl {
    url = "https://github.com/zen-browser/desktop/releases/download/1.7.6b/zen-x86_64.AppImage";
    hash = "sha256-GJuxooMV6h3xoYB9hA9CaF4g7JUIJ2ck5/hiQp89Y5o=";
  };
}
