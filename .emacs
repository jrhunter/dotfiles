(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized/")
(progn
    (require 'color-theme)
    (color-theme-initialize)
    (require 'color-theme-solarized)
    (color-theme-solarized-light))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-command "pdflatex")
 '(fringe-mode 0 nil (fringe))
 '(scroll-bar-mode (quote right))
 '(setq visible-bell t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 143 :width normal :foundry "unknown" :family "Inconsolata")))))
