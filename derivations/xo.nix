 { lib, pkgs, ... }:

pkgs.stdenv.mkDerivation rec {
  pname = "xo";
  version = "1.0.2";

  src = pkgs.fetchurl {
    url = "https://github.com/xo/xo/releases/download/v1.0.2/xo-1.0.2-linux-amd64.tar.bz2";
    hash = "sha256-2yhfbvRR3R+wOGokwzbH0ufYhgRZ2GXQHFgwalNUBFI=";
  };

  nativeBuildInputs = [
    pkgs.autoPatchelfHook
  ];

  buildInputs = [
  ];

  sourceRoot = ".";

  # installPhase = ''
  #   runHook preInstall
  #   install -m755 -D studio-link-standalone-v${version} $out/bin/studio-link
  #   runHook postInstall
  # '';
}