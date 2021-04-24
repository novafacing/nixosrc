{ fetchFromGitHub
, stdenv
, lib
, SDL2
, libGL
, libarchive
, libusb-compat-0_1
, qtbase
, qmake
, git
, libpng_apng
, pkg-config
}:

stdenv.mkDerivation rec {
  pname = "CEmu";
  version = "1.3";
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "CEmu";
    rev = "v${version}";
    sha256 = "1wcdnzcqscawj6jfdj5wwmw9g9vsd6a1rx0rrramakxzf8b7g47r";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    qmake
    git
    pkg-config
  ];

  buildInputs = [
    SDL2
    libGL
    libarchive
    libusb-compat-0_1
    qtbase
    libpng_apng
  ];
  dontWrapQtApps = true;
  patches = ''
diff --git a/gui/qt/tivarslib/BinaryFile.cpp b/gui/qt/tivarslib/BinaryFile.cpp
index f23e8a1..441b892 100644
--- a/gui/qt/tivarslib/BinaryFile.cpp
+++ b/gui/qt/tivarslib/BinaryFile.cpp
@@ -7,6 +7,7 @@
 
 #include "BinaryFile.h"
 #include "tivarslib_utils.h"
+#include <stdexcept>
 
 namespace tivars
 {
@@ -59,6 +60,7 @@ namespace tivars
         } else {
             throw std::runtime_error("No file loaded");
         }
+        return {0};
     }
 
     /**
@@ -81,7 +83,8 @@ namespace tivars
             return buf;
         } else {
             throw std::runtime_error("No file loaded");
-        }
+        };
+        return {0};
     }
 
     void BinaryFile::close()
diff --git a/gui/qt/tivarslib/TIModel.cpp b/gui/qt/tivarslib/TIModel.cpp
index ab0890e..b3e16b2 100644
--- a/gui/qt/tivarslib/TIModel.cpp
+++ b/gui/qt/tivarslib/TIModel.cpp
@@ -7,6 +7,7 @@
 
 #include "TIModel.h"
 #include "TIModels.h"
+#include <stdexcept>
 
 namespace tivars
 {
@@ -38,6 +39,7 @@ namespace tivars
         {
             throw std::invalid_argument("Invalid version ID");
         }
+        return TIModel();
     }
 
     /**
@@ -59,6 +61,7 @@ namespace tivars
         {
             throw std::invalid_argument("Invalid version name");
         }
+        return TIModel();
     }
 
     /**
@@ -80,6 +83,7 @@ namespace tivars
         {
             throw std::invalid_argument("Invalid version signature");
         }
+        return TIModel();
     }
 }
  '';
 


  qmakeFlags = [
    "gui/qt"
  ];

  meta = with lib; {
    changelog = "https://github.com/CE-Programming/CEmu/releases/tag/v${version}";
    description = "Third-party TI-84 Plus CE / TI-83 Premium CE emulator, focused on developer features";
    homepage = "https://ce-programming.github.io/CEmu";
    license = licenses.gpl3;
    maintainers = with maintainers; [ luc65r ];
    platforms = [ "x86_64-linux" "x86_64-darwin" ];
  };
}
