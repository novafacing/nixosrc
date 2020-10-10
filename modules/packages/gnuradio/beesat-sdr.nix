{ stdenv, fetchFromGitHub, cmake, pkgconfig, boost, gnuradio,
 python, swig, git, cppunit,
 bison, flex }:
stdenv.mkDerivation rec {
  name = "beesat-sdr";

  src = fetchFromGitHub {
    owner = "hpfmn";
    repo = "beesat-sdr";
    rev = "5b7a3aa9c9991ed36d5aa493c3256a75d4d4913f";
    sha256 = "1ig6lpac2mbpljr8qinds9c3mmp8mb37xpd222z8r76ixnaajzv5";
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

  sourceRoot = "/build/source/gr-tnc_nx";

  buildInputs = [
    boost gnuradio python
  ];

  enableParallelBuilding = true;
}

