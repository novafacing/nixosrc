{ stdenv, fetchFromGitHub, obs-studio, cmake, qt5, myndi }:

stdenv.mkDerivation rec {
  pname = "obs-ndi";
  version = "4.7.1";

  nativeBuildInputs = [ cmake ];
  buildInputs = [ obs-studio qt5.qtbase myndi ];

  src = fetchFromGitHub {
    owner = "Palakis";
    repo = "obs-ndi";
    rev = version;
    sha256 = "040fkbf3f3qgqcrd3072y3zrjb4fwga8zr10jym744xd7bgyylqh";
  };

  patches = [ ./fix-search-path.patch ./hardcode-ndi-path.patch ];

  postPatch = "sed -i -e s,@NDI@,${myndi},g src/obs-ndi.cpp";

  cmakeFlags = [
    "-DLIBOBS_INCLUDE_DIR=${obs-studio}/include/obs"
    "-DLIBOBS_LIB=${obs-studio}/lib"
    "-DCMAKE_CXX_FLAGS=-I${obs-studio.src}/UI/obs-frontend-api"
  ];

  meta = with stdenv.lib; {
    description = "Network A/V plugin for OBS Studio";
    homepage = https://github.com/Palakis/obs-ndi;
    maintainers = with maintainers; [ peti ];
    license = licenses.gpl2;
    platforms = with platforms; linux;
  };
}
