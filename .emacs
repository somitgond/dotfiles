;; emacs config files
;; references:
;; 1. https://gitlab.com/Kaligule/emacs-config/-/blob/master/config.org

;;;; Code:
;; optimizations
(setq gc-cons-threshold 100000000) ; 100mb
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; set custom file
(setq custom-file "~/.emacs.custom.el")

;; adding melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; setting custom fonts
(add-to-list 'default-frame-alist `(font . "Iosevka-14"))

;; UI customizations
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(setq inhibit-startup-screen t)
;;(setq initial-major-mode 'org-mode)
(setq initial-scratch-message nil)
(defun display-startup-echo-area-message ()
  (message "Leave: C-x C-c  Help: C-h C-h"))

(setq display-line-numbers 'relative) 

;; don't suspend witn C-z
(global-unset-key (kbd "C-z"))
;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers 1)
(setq dired-auto-revert-buffer 1)
;; auto refresh dired when file changes
(add-hook 'dired-mode-hook 'auto-revert-mode)
(ido-mode 1)

(global-display-line-numbers-mode)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; show trailing whitespace
;;(setq-default show-trailing-whitespace t)

;; incremental search
(setq isearch-lazy-highlight t)
(setq isearch-lazy-count t)
(setq lazy-count-suffix-format ""
      lazy-count-prefix-format "(%s of %s matches) ")

;; installing packages
;;(require 'org)
;;(require 'smex)
(require 'tree-sitter)
(require 'tree-sitter-langs)

;; for git
(use-package magit
  :bind ("C-x g" . magit-status))

;; text completion
(use-package company
  :ensure t
  :config
  (global-company-mode 1))
(setq company-backends '(company-dabbrev-code company-keywords company-files))

;; parenthesis
(use-package smartparens
  :config
  (smartparens-global-mode 1)
  )
;; treesitter
(add-hook 'go-mode-hook #'tree-sitter-mode)
(add-hook 'python-mode-hook #'tree-sitter-mode)t
(add-hook 'cc-mode-hook #'tree-sitter-mode)
(add-hook 'c-mode-hook #'tree-sitter-mode)

;; using eglot
(add-hook 'go-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'cc-mode-hook 'eglot-ensure)
;; which-key
(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3)
  (which-key-setup-side-window-right-bottom)
  )

;; smex key bindings
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; org-mode key bindings
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; custom keyboard shortcuts


(load-file custom-file)
