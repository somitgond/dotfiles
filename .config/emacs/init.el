;; emacs config files
;; references:
;; 1. https://gitlab.com/Kaligule/emacs-config/-/blob/master/config.org

;; set custom file
(setq custom-file "~/.config/emacs/custom.el")
(setq python-shell-virtualenv-path "~/.local/python3/")

;; package install
(require 'package)
(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; package sources
(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/")
        ("ORG"          . "https://orgmode.org/elpa/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("nongnu"       . "https://elpa.nongnu.org/nongnu/"))
      package-archive-priorities
      '(("GNU ELPA"     . 20)
        ("MELPA"        . 15)
        ("ORG"          . 10)
        ("MELPA Stable" . 5)
        ("nongnu"       . 0)))
(package-initialize)

;; setting custom fonts
;;(add-to-list 'default-frame-alist `(font . "Iosevka-14"))
(add-to-list 'default-frame-alist `(font . "JetBrains Mono-13"))

;; stop creating ~ files
(setq make-backup-files nil)

(blink-cursor-mode 0)

;;(setq display-line-numbers-type 'relative) 
(global-display-line-numbers-mode 1)

;; word wrap 
(global-visual-line-mode t)

;; don't suspend witn C-z
(global-unset-key (kbd "C-z"))
;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers 1)
(setq dired-auto-revert-buffer 1)
;; auto refresh dired when file changes
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; ido mode
(ido-mode 1)
(ido-everywhere 1)

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
;; treesitter: emacs compiled with --tree-sitter flag
(add-hook 'go-mode-hook #'tree-sitter-mode)
(add-hook 'python-mode-hook #'tree-sitter-mode)t
(add-hook 'cc-mode-hook #'tree-sitter-mode)
(add-hook 'c-mode-hook #'tree-sitter-mode)

;; using eglot as lsp: inbuilt in emacs
;;(add-hook 'go-mode-hook 'eglot-ensure)
;;(add-hook 'c-mode-hook 'eglot-ensure)
;;(add-hook 'python-mode-hook 'eglot-ensure)
;;(add-hook 'cc-mode-hook 'eglot-ensure)
;; which-key

;; smex key bindings
;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; amx
;;(use-package amx
;;  :config
;;  (amx-mode 1))
(require 'amx)
(amx-mode 1)

;; icomplete mode
;;(require 'icomplete)
;;(icomplete-mode 1)

;; org-mode key bindings
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; org mode stuff
(setq org-hide-leading-stars t)
(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

;; Custom keyboard shortcuts



;; load custom file
(load-file custom-file)
