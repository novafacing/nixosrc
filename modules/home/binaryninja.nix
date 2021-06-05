{ config, lib, pkgs, fetchurl, ... }:

let
  configfile = ''
    {
      "updates": {
          "activeContent": false
      },
      "python": {
        "interpreter": "${pkgs.python38Full}/lib/libpython3.7m.so"
      },
      "arch": {
        "x86": {
          "disassembly": {
            "syntax": "INTEL"
          }
        }
      },
      "downloadClient": {
        "providerName": "PythonDownloadProvider"
      },
      "pdb": {
        "autoDownload": true,
        "localStoreAbsolute": "/home/novafacing/.binaryninja/store/"
      },
      "triage": {
        "analysisMode": "full",
        "hiddenFiles": true,
        "linearSweep": "full"
      },
      "ui": {
        "debugMode": true,
        "font": {
          "name": "Source Code Pro",
          "size": 11,
          "spacing": 0,
          "bold": false
        },
        "graph": {
          "carousel": ["Disassembly", "HighLevelIL", "LowLevelIL"],
          "preferred": true,
          "default": "Disassembly"
        },
        "view": {
          "disassembly": {
            "type": "Disassembly"
          }
        },
        "theme": "gruvbox"
      }
    }
  '';
  themefile = ''
      {
      "name": "gruvbox",
      "style": "Fusion",

      "colors": {
          "black": [40, 40, 40],
          "white": [235, 219, 178],
          "lightBlue": [131, 165, 152],
          "green": [184, 187, 38],
          "yellow": [250, 189, 47],
          "red": [251, 73, 52],
          "purple": [211, 134, 155],
          "darkBlue": [69, 133, 136],
          "grey": [130, 115, 116]
      },

      "palette": {
          "Window":          ["~", "white", "black", 240],
          "WindowText":      "white",
          "Base":            "black",
          "AlternateBase":   "grey",
          "ToolTipBase":     "black",
          "ToolTipText":     "lightBlue",
          "Text":            "white",
          "Button":          "black",
          "ButtonText":      "lightBlue",
          "BrightText":      "grey",
          "Link":            "green",
          "Highlight":       "lightBlue",
          "HighlightedText": "black",
          "Light":           "lightBlue"
      },

      "theme-colors": {
          "addressColor":                         "green",
          "modifiedColor":                        "red",
          "insertedColor":                        "lightBlue",
          "notPresentColor":                      "lightBlue",
          "selectionColor":                       "green",
          "outlineColor":                         "green",
          "backgroundHighlightDarkColor":         "black",
          "backgroundHighlightLightColor":        "black",
          "boldBackgroundHighlightDarkColor":     "darkBlue",
          "boldBackgroundHighlightLightColor":    "red",
          "alphanumericHighlightColor":           "lightBlue",
          "printableHighlightColor":              "yellow",
          "graphBackgroundDarkColor":             "black",
          "graphBackgroundLightColor":            "black",
          "graphNodeDarkColor":                   "black",
          "graphNodeLightColor":                  "black",
          "graphNodeOutlineColor":                "lightBlue",
          "trueBranchColor":                      "green",
          "falseBranchColor":                     "red",
          "unconditionalBranchColor":             "lightBlue",
          "altTrueBranchColor":                   "lightBlue",
          "altFalseBranchColor":                  "red",
          "altUnconditionalBranchColor":          "lightBlue",
          "registerColor":                        "red",
          "numberColor":                          "yellow",
          "codeSymbolColor":                      "green",
          "dataSymbolColor":                      "purple",
          "stackVariableColor":                   ["+", "white", "lightBlue"],
          "importColor":                          ["+", "white","green"],
          "instructionHighlightColor":            ["~", "grey", "black", 50],
          "tokenHighlightColor":                  "purple",
          "annotationColor":                      "white",
          "opcodeColor":                          "lightBlue",
          "linearDisassemblyFunctionHeaderColor": "black",
          "linearDisassemblyBlockColor":          "black",
          "linearDisassemblyNoteColor":           "black",
          "linearDisassemblySeparatorColor":      "lightBlue",
          "stringColor":                          "yellow",
          "typeNameColor":                        "lightBlue",
          "fieldNameColor":                       "darkBlue",
          "keywordColor":                         "green",
          "uncertainColor":                       "lightBlue",
          "scriptConsoleOutputColor":             "white",
          "scriptConsoleErrorColor":              "red",
          "scriptConsoleEchoColor":               "green",
          "blueStandardHighlightColor":           "darkBlue",
          "greenStandardHighlightColor":          "green",
          "cyanStandardHighlightColor":           "lightBlue",
          "redStandardHighlightColor":            "red",
          "magentaStandardHighlightColor":        "purple",
          "yellowStandardHighlightColor":         "yellow",
          "orangeStandardHighlightColor":         ["+", "yellow", "red"],
          "whiteStandardHighlightColor":          "white",
          "blackStandardHighlightColor":          "black"
      }
    }
  '';
  vulnfanatic = pkgs.fetchFromGitHub {
    owner = "Martyx00";
    repo = "VulnFanatic";
    rev = "28dbdc9326add25408834919b42daec79efa8c24";
    sha256 = "05q9f0dkd3sg94x6gln4gdz4s7bpyvai4178lmqqsnmhljmgg92h";
  };
  gba-toolkit = pkgs.fetchFromGitHub {
    owner = "novafacing";
    repo = "binja-toolkit";
    rev = "d5b836be1a93f597823b5996e00b926e23c336f0";
    sha256 = "0d3zdz7886i7isp8p4ic3sj5zvbbgbhf72xib8b9s4znp2cd7qbz";
  };
  bnhook = pkgs.fetchFromGitHub {
    owner = "novafacing";
    repo = "bnhook";
    rev = "a3697db5f741855eea227f881c396fb9d868a0f8";
    sha256 = "00533sjm2m46pb4xdj9m0cva40vbml3kdw0jbwxvdkw1jmh2cqnr";
  };
  annotate = pkgs.fetchFromGitHub {
    owner = "novafacing";
    repo = "annotate";
    rev = "5dbcb985d6b969a52e430e381c566d72aad38d86";
    sha256 = "0x5llhjfzfdzi82dd9i0fs4cwrp6393xdlcb0hyjbz5gc5xh26dc";
  };
  format-string-finder = pkgs.fetchFromGitHub {
    owner = "novafacing";
    repo = "format-string-finder-binja";
    rev = "a02d1501ca1db1c4ea0ced65c01af0d5ad1c8712";
    sha256 = "00msf3icxnscnn3f262zg3hrm9gdwkz4qnwpw8xl9h7pqn59wizv";
  };
  syscaller = pkgs.fetchFromGitHub {
    owner = "novafacing";
    repo = "Syscaller";
    rev = "ba753c6b5b5a91dfe2099e103bdd488a8b94f74c";
    sha256 = "1dw5v4bv70zsqzpwmgywkznski8mrfwhidlhsv6bin5wa1g203dz";
  };
  seninja = pkgs.fetchFromGitHub {
    owner = "novafacing";
    repo = "seninja";
    rev = "a0c577e5f578718dba477e143ab729270bbe39c2";
    sha256 = "0h8a3zh7sdi7l5m3vywd0s36wcdqb8d7mgy5ky80qjx76mpm9cvh";
  };
  cleantricks = pkgs.fetchFromGitHub {
    owner = "novafacing";
    repo = "CleanTricks";
    rev = "bf0b8efbc6e27b16e72f26640fef9cc4fd4e3c44";
    sha256 = "0i3ycxcs9i9p5c2anrvz4ia3jrjzw4qwvl1mympbs5jq453l3xr3";
  };
in
  {
    home.file.".binaryninja/settings.json".text = configfile;
    home.file.".binaryninja/themes/gruvbox.bntheme".text = themefile;
    home.file.".binaryninja/plugins/VulnFanatic" = {
      source = vulnfanatic;
      executable = true;
      recursive = true;
    };
    home.file.".binaryninja/plugins/binja-toolkit" = {
      source = gba-toolkit;
      executable = true;
      recursive = true;
    };
    home.file.".binaryninja/plugins/bnhook" = {
      source = bnhook;
      executable = true;
      recursive = true;
    };
    home.file.".binaryninja/plugins/annotate" = {
      source = annotate;
      executable = true;
      recursive = true;
    };
    home.file.".binaryninja/plugins/format-string-finder" = {
      source = format-string-finder;
      executable = true;
      recursive = true;
    };
    home.file.".binaryninja/plugins/syscaller" = {
      source = syscaller;
      executable = true;
      recursive = true;
    };
    home.file.".binaryninja/plugins/seninja" = {
      source = seninja;
      executable = true;
      recursive = true;
    };
    home.file.".binaryninja/plugins/cleantricks" = {
      source = cleantricks;
      executable = true;
      recursive = true;
    };
  }
