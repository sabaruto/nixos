{ pkgs, ... }:

pkgs.buildGoModule rec {
  pname = "xo";
  version = "1.0.2";

  src = pkgs.fetchFromGitHub {
    owner = "xo";
    repo = "xo";
    rev = "v${version}";
    hash = "sha256-cmSY+Et2rE+hLZ1+d2Vvwp+CX0hfLz08QKivQQd7SIQ=";
  };

  vendorHash = "sha256-aTjLoP7u2mMF1Ns/Wb9RR0xAqQCZJjjb5UzY2de6yBU=";

  meta = {
    description = "xo is a command-line tool to generate idiomatic code for different languages code based on a database schema or a custom query.";
    homepage = "https://github.com/xo/xo";
  };
}