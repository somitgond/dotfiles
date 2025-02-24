;; emacs config files
;; references:
;; 1. https://gitlab.com/Kaligule/emacs-config/-/blob/master/config.org

;; set custom file
(setq custom-file "~/.config/emacs/custom.el")
(setq python-shell-virtualenv-path "~/.local/python3/")

;; setting custom fonts
;;(add-to-list 'default-frame-alist `(font . "Iosevka-14"))
(add-to-list 'default-frame-alist `(font . "JetBrains Mono-13"))

;; optimizations
;; We can set the file-name-handler-alist, which is supposed to help startup times a little.
(setq file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

;; ignore native compilation warnings
(setq native-comp-async-report-warnings-errors 'silent) ;; native-comp warning
(setq byte-compile-warnings '(not free-vars unresolved noruntime lexical make-local))

;; This is an optimisation borrowed from Doom Emacs’ core.el.
(setq which-func-update-delay 1.0)

;; Fix IO bugs.
(setq process-adaptive-read-buffering nil)
(setq read-process-output-max (* 4 1024 1024))

;; Prevent Emacs from freezing when updating ELPA.
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;; HOUSE KEEPING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-emacs-directory "~/.config/emacs/")
(setq default-directory "~/")

;; Set UTF-8 as preferred coding system.
(set-language-environment    "UTF-8")
(setq locale-coding-system   'utf-8)
(prefer-coding-system        'utf-8)
(set-default-coding-systems  'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)

;; Don’t warn me when opening files unless over 50 MB.
(setq large-file-warning-threshold (* 50 1024 1024))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; PACKAGE MANAGER ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DECLUTTERING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(dolist (mode
         '(tool-bar-mode       ;; Remove toolbar
           scroll-bar-mode     ;; Remove scollbars
           menu-bar-mode       ;; Remove menu bar
           blink-cursor-mode)) ;; Solid cursor, not blinking
  (funcall mode 0))

(setq inhibit-startup-message           t       ;; No startup message
      inhibit-startup-echo-area-message t       ;; No startup message in echo area
      inhibit-startup-screen            t       ;; No default startup screen
      initial-buffer-choice             t       ;; *scratch* is default startup buffer
      initial-major-mode                'fundamental-mode
      ring-bell-function                'ignore ;; No bell
      display-time-default-load-average nil     ;; Don't show me load time
      scroll-margin                     0       ;; Space between top/bottom
      use-dialog-box                    nil)    ;; Disable dialog

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FRAMES & WINDOWS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Open in fullscreen
;;(add-to-list 'default-frame-alist     '(fullscreen . maximized))
;; (add-hook 'window-setup-hook          'toggle-frame-fullscreen t)  ;; F11

;; frame border
;;(add-to-list 'default-frame-alist '(internal-border-width . 16))

;; fringes
;;(set-fringe-mode 10)                          ;; Set fringe width to 10

(setq-default fringes-outside-margins nil)
(setq-default indicate-buffer-boundaries nil) ;; Otherwise shows a corner icon on the edge
(setq-default indicate-empty-lines nil)       ;; Otherwise there are weird fringes on blank lines

(set-face-attribute 'header-line t :inherit 'default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PROGRAMMING-SPECIFIC VISUALS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; styling delimiters
(use-package rainbow-delimiters
  :hook (prog-mode-hook . rainbow-delimiters-mode))

(show-paren-mode t) ;; Highlight matching parentheses

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MODE LINE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(column-number-mode t) ;; Show current column number in mode line

;; adaptive wrap
(use-package adaptive-wrap
  :defer t
  :hook (visual-line-mode . adaptive-wrap-prefix-mode))

;; writeroom mode
(use-package writeroom-mode
  :defer t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GENERAL EDITING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(delete-selection-mode   t) ;; Replace selected text when yanking
(global-so-long-mode     t) ;; Mitigate performance for long lines
(global-visual-line-mode t) ;; Break lines instead of truncating them
(global-auto-revert-mode t) ;; Revert buffers automatically when they change
(recentf-mode            t) ;; Remember recently opened files
(savehist-mode           t) ;; Remember minibuffer prompt history
(save-place-mode         t) ;; Remember last cursor location in file

(setq auto-revert-interval         1         ;; Refresh buffers fast
      auto-revert-verbose          nil       ;; Don't notify me about reverts
      echo-keystrokes              0.1       ;; Show keystrokes fast
      frame-inhibit-implied-resize 1         ;; Don't resize frame implicitly
      sentence-end-double-space    nil       ;; No double spaces
      recentf-max-saved-items      1000      ;; Show more recent files
      use-short-answers            t         ;; 'y'/'n' instead of 'yes'/'no' etc.
      save-interprogram-paste-before-kill t  ;; Save copies between programs
      history-length               25        ;; Only save the last 25 minibuffer prompts
      global-auto-revert-non-file-buffers t) ;; Revert Dired and other buffers

(setq-default tab-width 4)  ;; Smaller tabs

;; smoother scrolling
(setq scroll-conservatively            101
      mouse-wheel-follow-mouse         't
      mouse-wheel-progressive-speed    nil
      ;; Scroll 1 line at a time, instead of default 5
      ;; Hold shift to scroll faster and meta to scroll very fast
      mouse-wheel-scroll-amount        '(1 ((shift) . 3) ((meta) . 6)))

;; (Native) smooooooth scrolling
(setq pixel-scroll-precision-mode t)

(setq mac-redisplay-dont-reset-vscroll t
      mac-mouse-wheel-smooth-scroll    nil)

;; Auto saving
(defvar emacs-autosave-directory
  (concat user-emacs-directory "autosaves/")
  "This variable dictates where to put auto saves. It is set to a
  directory called autosaves located wherever your .emacs.d/ is
  located.")

;; Sets all files to be backed up and auto saved in a single directory.
(setq backup-directory-alist
      `((".*" . ,emacs-autosave-directory))
      auto-save-file-name-transforms
      `((".*" ,emacs-autosave-directory t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEXT EDITING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(use-package crux
;;  :defer t
;;  :bind (:map custom-bindings-map
;;         ("C-S-<return>" . crux-smart-open-line-above)
;;         ("M-S-<down>"   . crux-duplicate-current-line-or-region)))

;; kill whole line
(define-key custom-bindings-map (kbd "C-S-k") 'kill-whole-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; iBuffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq ibuffer-saved-filter-groups
      '(("default"
         ("Programming"   (predicate . (derived-mode-p 'prog-mode)))
         ("Clojure/CIDER" (or (name  . "clojure")
                              (name  . "cider")
                              (name  . "nrepl")))
         ("Org"           (mode . org-mode))
         ("Dired"         (mode . dired-mode))
         ("Magit"         (name . "magit")))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

;; exclude certain buffer
(setq ibuffer-never-show-predicates
      '(;; System buffers
        "^\\*Messages\\*$"
        "^\\*scratch\\*$"
        "^\\*Completions\\*$"
        "^\\*Help\\*$"
        "^\\*Apropos\\*$"
        "^\\*info\\*$"
        "^\\*Async-native-compile-log\\*$"

        ;; LSP Buffers
        "^\\*lsp-log\\*$"
        "^\\*clojure-lsp\\*$"
        "^\\*clojure-lsp::stderr\\*$"
        "^\\*ts-ls\\*$"
        "^\\*ts-ls::stderr\\*$"))

;; company
(use-package company
  :config
  (setq company-idle-delay                 0.0
        company-minimum-prefix-length      2
        company-tooltip-align-annotations  t
        company-tooltip-annotation-padding 1
        company-tooltip-margin             1
        company-detect-icons-margin        'company-dot-icons-margin)
  (global-company-mode t))


;; ido mode
(ido-mode 1)
(ido-everywhere 1)

;; incremental search
(setq isearch-lazy-highlight t)
(setq isearch-lazy-count t)
(setq lazy-count-suffix-format ""
      lazy-count-prefix-format "(%s of %s matches) ")

(use-package magit
  :bind ("C-x g" . magit-status))

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

;; use mx completion
(require 'amx)
(amx-mode 1)

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
