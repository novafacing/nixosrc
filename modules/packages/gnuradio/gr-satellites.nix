{ stdenv, fetchFromGitHub, cmake, pkgconfig, boost, gnuradio,
 python, swig, git, cppunit,
 bison, flex, beesat-sdr,
 construct, requests, urllib3, chardet, idna }:
let
  version = "";
  libfec = stdenv.mkDerivation rec {
  	name = "libfec";
  	src = fetchFromGitHub {
	  owner = "daniestevez";
	  repo = "libfec";
	  rev = "bce3be6a3d18652d9d3f7314b43291084342cbf1";
	  sha256 = "0fk57fg4i0c1cdx3yra0vj2a2jaxg86wx8n2b228hj76kgjhj3lw";
	};
	preConfigure = ''
		sed -i 's/REBIND=ldconfig/REBIND=""/' *
	'';
  };
in stdenv.mkDerivation rec {
  name = "gnuradio-satellites";

  src = fetchFromGitHub {
    owner = "daniestevez";
    repo = "gr-satellites";
    rev = "60a7e28dcba8fa8c27569c63c4dc10aea85e5534"; # maint-3.7
    sha256 = "06isc2whpq8aajvw9zqbkd16vqxx284zilqi08sxx7qz9swa7d97";
  };

  nativeBuildInputs = [
    cmake
    pkgconfig
    bison
    flex
    swig
    git
    cppunit
  ];

  buildInputs = [
    boost gnuradio python libfec beesat-sdr
  ];

  propagatedBuildInputs = [
    construct requests urllib3 chardet idna
  ];

  enableParallelBuilding = true;
}
