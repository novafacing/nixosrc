/*
* DISCLAIMER
* `angr` is so cutting-edge that it's dependent on unstable `unicorn` features;
* Probably this expression could be deleted once `unicorn` 1.0.2 will be released.
*/

{ buildPythonPackage
, fetchPypi
, isPy3k
, pkgs
}:

buildPythonPackage rec {
  pname = "unicorn";
  version = "1.0.2rc4";
  disabled = !isPy3k;

  src = fetchPypi {
    inherit pname version;
    sha256 = "10a7pp9g564kqqinal7s8ainbw2vkw0qyiq827k4j3kny9h4japd";
  };

  meta = with pkgs.lib; {
    description = "Python binding for the lightweight multi-platform, multi-architecture CPU emulator framework";
    homepage = "https://www.unicorn-engine.org/";
    license = licenses.gpl2;
    maintainers = [ maintainers.pamplemousse ];
  };
}
