;;; config.el -- Settings
(require 'ligature "/home/novafacing/nixos/modules/home/doom.d/ligature.el")
(require 'doom-gruvbox-material "/home/novafacing/nixos/modules/home/doom.d/themes/gruvbox.el")
;;; Code:
(setq doom-font (font-spec :family "Fira Code" :size 12)
      doom-variable-pitch-font (font-spec :family "Fira Code iCursive S12")
      doom-unicode-font (font-spec :family "Noto Emoji" :size 12)
      doom-big-font (font-spec :family "Fira Code iCursive S12" :size 16))

;; Enable the www ligature in every possible major mode
(ligature-set-ligatures 't '("www"))

;; Enable ligatures in programming modes
(ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                     "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                     "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                     "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

(global-ligature-mode 't)

(setq doom-theme 'doom-gruvbox-material)
;;; Commentary:
