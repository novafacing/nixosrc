{ config, lib, pkgs, fetchurl, ... }:

let
  configfile = ''
  {
      "updates": {
          "activeContent": false
      },
      "python": {
        "interpreter": "${pkgs.python37Full}/lib/libpython3.7m.so"
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
          "name": "Fira Code iCursive S12",
          "size": 10,
          "spacing": 0
        },
        "graph": {
          "carousel": ["Disassembly", "HighLevelIL", "LowLevelIL"],
          "preferred": true
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
in
  {
    home.file.".binaryninja/settings.json".text = configfile;
    home.file.".binaryninja/themes/gruvbox.bntheme".text = themefile;
  }
