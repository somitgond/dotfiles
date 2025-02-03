;; emacs config files

;; optimizations
(setq gc-cons-threshold 100000000) ; 100mb
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; set custom file
(setq custom-file "~/.emacs.custom.el")

;; setting custom fonts
(add-to-list 'default-frame-alist `(font . "Iosevka-14"))


(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)

(ido-mode 1)

(global-display-line-numbers-mode)

;; adding melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; installing packages
;;(require 'org)
;;(require 'smex)

(use-package magit
  :bind ("C-x g" . magit-status))

;; smex key bindings
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; org-mode key bindings
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; custom keyboard shortcuts

;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)

(load-file custom-file)
