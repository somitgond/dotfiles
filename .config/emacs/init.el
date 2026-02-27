;; -*- lexical-binding: t; -*-
(setq custom-file "~/.config/emacs/custom.el")

;; part of https://github.com/MiniApollo/kickstart.emacs/blob/main/init.org
;; package config
(require 'use-package-ensure) ;; Load use-package-always-ensure
(setq use-package-always-ensure t) ;; Always ensures that a package is installed

;; package repos
(setq package-archives '(("melpa" . "https://melpa.org/packages/") ;; Sets default package repositories
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/"))) ;; For Eat Terminal

(add-to-list 'default-frame-alist
             '(font . "Hack-13"))

(setq package-quickstart t) ;; For blazingly fast startup times, this line makes startup miles faster

;; for async processing
(use-package async
  :defer
  :custom
  (dired-async-mode t)
  (async-bytecomp-package-mode t)
  (async-bytecomp-allowed-packages '(all))
  (async-package-do-action t))

(use-package emacs
  :custom
  ;; Still needed for terminals
  (menu-bar-mode nil)         ;; Disable the menu bar
  (scroll-bar-mode nil)       ;; Disable the scroll bar
  (tool-bar-mode nil)         ;; Disable the tool bar

  (inhibit-startup-screen t)  ;; Disable welcome screen

  (delete-selection-mode t)   ;; Select text and delete it by typing.
  (electric-indent-mode nil)  ;; Turn off the weird indenting that Emacs does by default.
  (electric-pair-mode t)      ;; Turns on automatic parens pairing

  (blink-cursor-mode nil)     ;; Don't blink cursor
  (global-auto-revert-mode t) ;; Automatically reload file and show changes if the file has changed
  (use-short-answers t)   ;; Since Emacs 29, `yes-or-no-p' will use `y-or-n-p'

  ;;(dired-kill-when-opening-new-dired-buffer t) ;; Dired don't create new buffer
  ;;(recentf-mode t) ;; Enable recent file mode
  ;;(context-menu-mode t) ;; Right-click menu

  ;;(global-visual-line-mode t)           ;; Enable line wrapping (NOTE: breaks vundo)
  (global-display-line-numbers-mode t)  ;; Display line numbers
  ;;(display-line-numbers-type 'relative) ;; Relative line numbers
  (global-hl-line-mode t)               ;; Highlight current line

  (native-comp-async-report-warnings-errors 'silent) ;; Don't show native comp errors
  (warning-minimum-level :error) ;; Only show errors in warnings buffer

  (mouse-wheel-progressive-speed nil) ;; Disable progressive speed when scrolling
  (scroll-conservatively 10) ;; Smooth scrolling
  (scroll-margin 8)

  ;; (pixel-scroll-precision-mode t) ;; Precise pixel scrolling. i.e. smooth scrolling (GUI only)
  ;; (pixel-scroll-precision-use-momentum nil)

  (indent-tabs-mode nil) ;; Only use spaces for indentation
  (tab-width 2)
  (sgml-basic-offset 4) ;; Set Html mode indentation to 4
  (c-ts-mode-indent-offset 4) ;; Fix weird indentation in c-ts (C, C++)
  (go-ts-mode-indent-offset 4) ;; Fix weird indentation in go-ts

  ;; (display-fill-column-indicator-column 80) ;; Set line length indicator to 80 characters
  (whitespace-style '(face tabs tab-mark trailing))

  (make-backup-files nil) ;; Stop creating ~ backup files
  (auto-save-default nil) ;; Stop creating # auto save files
  (delete-by-moving-to-trash t)
  :hook
  (prog-mode . hs-minor-mode) ;; Enable folding hide/show globally
  ;; (prog-mode . display-fill-column-indicator-mode) ;; Display line length indicator
  (prog-mode . whitespace-mode)
  :config
  ;; Move customization variables to a separate file and load it, avoid filling up init.el with unnecessary variables
  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)
  :bind (
         ([escape] . keyboard-escape-quit) ;; Makes Escape quit prompts (Minibuffer Escape)
         ;; Zooming In/Out
         ("C-+" . text-scale-increase)
         ("C--" . text-scale-decrease)
         ("<C-wheel-up>" . text-scale-increase)
         ("<C-wheel-down>" . text-scale-decrease)
         ))

;; evil mode
(use-package evil
  :hook (after-init . evil-mode)
  :init
  (evil-mode)
  :config
  (evil-set-initial-state 'eat-mode 'insert) ;; Set initial state in eat terminal to insert mode
  ;; (global-set-key [C-backspace] 'evil-delete-backward-word) ;; Make C-backspace less agressive
  :custom
  (evil-want-keybinding nil)    ;; Disable evil bindings in other modes (It's not consistent and not good)
  (evil-want-C-u-scroll t)      ;; Set C-u to scroll up
  (evil-want-C-i-jump nil)      ;; Disables C-i jump
  (evil-undo-system 'undo-fu) ;; C-r to redo
  (evil-want-fine-undo t)
  ;; (evil-respect-visual-line-mode t) ;; Move in wrap lines
  ;; Unmap keys in 'evil-maps. If not done, org-return-follows-link will not work
  :bind (:map evil-motion-state-map
              ("SPC" . nil)
              ("RET" . nil)
              ("TAB" . nil)))
(use-package evil-collection
  :after evil
  :config
  ;; Setting where to use evil-collection)
  (setq evil-collection-mode-list '(dired ibuffer magit corfu consult info (package-menu package) bookmark))
  (evil-collection-init))

(use-package undo-fu
  :defer
  :config
  ;; Increase undo history limits to reduce likelihood of data loss
  (setq undo-limit (* 1024 1024 64)          ;; 64mb  (default is 160kb)
        undo-strong-limit (* 1024 1024 96)   ;; 96mb  (default is 240kb)
        undo-outer-limit (* 1024 1024 960))) ;; 960mb (default is 24mb)

;; theme
(use-package gruber-darker-theme
  :init
  (load-theme 'gruber-darker t))

;; doom-modeline
(use-package doom-modeline
  :custom
  (doom-modeline-height 25) ;; Set modeline height
  :hook (after-init . doom-modeline-mode))

;; org-mode setup
(use-package org
  :ensure nil
  :custom
  (org-return-follows-link t)   ;; Sets RETURN key in org-mode to follow links
  :hook
  (org-mode . org-indent-mode) ;; Indent text
  )
 
;; table of contents in org mode
(use-package toc-org
  :commands toc-org-enable
  :hook (org-mode . toc-org-mode))

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode))

;; magit
(use-package magit
  :defer
  :custom (magit-diff-refine-hunk (quote all)) ;; Shows inline diff
  :config
  (setopt magit-format-file-function #'magit-format-file-nerd-icons) ;; Magit nerd icons
  )

;; orderless 
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))

;; Enable Vertico.
(use-package vertico
  :init
  (vertico-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; from here: https://kristofferbalintona.me/posts/202202211546/
(use-package marginalia
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right)
  :init
  (marginalia-mode))

(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))

;; add colors to brackets
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; highlight todos
(use-package hl-todo
  :hook
  ((prog-mode yaml-ts-mode) . hl-todo-mode)
  :config
  ;; From doom emacs
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        '(;; For reminders to change or add something at a later date.
          ("TODO" warning bold)
          ;; For code (or code paths) that are broken, unimplemented, or slow,
          ;; and may become bigger problems later.
          ("FIXME" error bold)
          ;; For code that needs to be revisited later, either to upstream it,
          ;; improve it, or address non-critical issues.
          ("REVIEW" font-lock-keyword-face bold)
          ;; For code smells where questionable practices are used
          ;; intentionally, and/or is likely to break in a future update.
          ("HACK" font-lock-constant-face bold)
          ;; For sections of code that just gotta go, and will be gone soon.
          ;; Specifically, this means the code is deprecated, not necessarily
          ;; the feature it enables.
          ("DEPRECATED" font-lock-doc-face bold)
          ;; Extra keywords commonly found in the wild, whose meaning may vary
          ;; from project to project.
          ("NOTE" success bold)
          ("BUG" error bold)
          ("XXX" font-lock-constant-face bold)))
  )
