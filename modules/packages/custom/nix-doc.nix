{ stdenv, lib, rustPlatform, fetchFromGitHub, pkgs, ... }:

rustPlatform.buildRustPackage rec {
  pname = "nix-doc";
  version = "v0.3.1";

  src = fetchFromGitHub {
    repo = pname;
    owner = "lf-";
    rev = version;
    sha256 = "1hiz0fsbsl74m585llg2n359gs8i2m6jh8zdikkwxd8xq7qmw032";
  };

  buildInputs = with pkgs; [ boost nix ];

  nativeBuildInputs = with pkgs; [ pkg-config ];

  cargoSha256 = "06b36jv8hk4gqqm4nbh9gfszncvixs3zcjph45wlx7z5m61y9sdg";

  meta = with lib; {
    homepage = url;
    license = licenses.lgpl3;
    description = "A Nix documentation lookup tool that quickly dumps the docs of the library function";
  };
}
