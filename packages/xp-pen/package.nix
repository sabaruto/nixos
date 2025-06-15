{ lib
, xorg
, stdenv
, autoPatchelfHook
, libusb1
, qtbase
, libglvnd
, wrapQtAppsHook
}:
with stdenv;
with xorg;
mkDerivation rec {
  pname = "xp-pen-artist-15.6-pro-driver";
  version = "3.4.9-240607";

  src = fetchTarball {
    url =
      "https://download01.xp-pen.com/file/2024/06/XPPenLinux${version}.tar.gz";
    sha256 = ''
      sha256:0qw5vjjzfwf7abra703b3zqmzsvl8fydiwdyk7d2bbz172a96xv5
    '';
  };

  nativeBuildInputs = [ autoPatchelfHook wrapQtAppsHook ];

  buildInputs =
    [ libusb1 libX11 libXtst qtbase libglvnd (lib.getLib stdenv.cc.cc) ];

  installPhase = ''
    mkdir -p $out/bin
    ls ./
    tar -xvf Linux_Pentablet_V1.2.13.1.tar.gz
    cp -r Linux_Pentablet_V1.2.13.1 $out/bin/pentablet-driver
  '';

  meta = with lib; {
    homepage = "https://www.xp-pen.com/download/artist-15-6-pro.html";
    description = "Driver for XP-PEN Pentablet drawing tablets";
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    platforms = [ "x86_64-linux" ];
    maintainers = [ ];
  };
}
