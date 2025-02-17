{ pkgs, ... }: 
let
  pname = "googledot-blue";
  version = "2.0.0";
  src = pkgs.fetchurl {
    url = "https://github.com/ful1e5/Google_Cursor/releases/download/v2.0.0/GoogleDot-Blue.tar.gz";
    hash = "sha256-Vc+s85xx1KFmjB/mvnwaXROPn2jgjfDOqWr04kIvcp0=";
  };
in
pkgs.stdenv.mkDerivation rec {
  inherit pname version src;
  installPhase = ''
    mkdir -p $out/.icons/GoogleDot-Blue
    mv cursors cursor.theme index.theme $out/.icons/GoogleDot-Blue
  '';
}
