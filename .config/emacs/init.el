;; emacs config files
;; references:
;; 1. https://gitlab.com/Kaligule/emacs-config/-/blob/master/config.org
;; 2. https://github.com/SophieBosio/.emacs.d

;; set custom file
(setq custom-file "~/.config/emacs/custom.el")
(setq python-shell-virtualenv-path "~/.local/python3/")

;; optimizations
;; garbage collection
(use-package gcmh
  :config
  (setq gcmh-idle-delay 5
        gcmh-high-cons-threshold (* 100 1024 1024))  ; 100mb
  (gcmh-mode 1))

;; We can set the file-name-handler-alist, which is supposed to help startup times a little.
(setq file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

;; ignore native compilation warnings
(setq native-comp-async-report-warnings-errors 'silent) ;; native-comp warning
(setq byte-compile-warnings '(not free-vars unresolved noruntime lexical make-local))

;; Disable warnings about obsolete functions when compiling.
(eval-when-compile
  (dolist (sym '(cl-flet lisp-complete-symbol))
    (setplist sym (use-package-plist-delete
                   (symbol-plist sym) 'byte-obsolete-info))))

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

;; fonts

;;(add-to-list 'default-frame-alist `(font . "Iosevka-14"))
(add-to-list 'default-frame-alist `(font . "JetBrains Mono-13"))
(use-package nerd-icons)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; custom keybindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; custom keymap
(defvar custom-bindings-map (make-keymap)
  "A keymap for custom keybindings.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FRAMES & WINDOWS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Open in fullscreen
;;(add-to-list 'default-frame-alist     '(fullscreen . maximized))
;;(add-hook 'window-setup-hook          'toggle-frame-fullscreen t)  ;; F11

;; frame border
;;(add-to-list 'default-frame-alist '(internal-border-width . 16))

;; fringes
;;(set-fringe-mode 10)                          ;; Set fringe width to 10

;; (setq-default fringes-outside-margins nil)
;; (setq-default indicate-buffer-boundaries nil)
;; Otherwise shows a corner icon on the edge
;; (setq-default indicate-empty-lines nil)
;; Otherwise there are weird fringes on blank lines

;; (set-face-attribute 'header-line t :inherit 'default)

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

;; olivetti mode
(use-package olivetti
  :defer t
  :bind (:map custom-bindings-map ("C-c o" . olivetti-mode))
  :config
  (setq olivetti-style t))

;; modeline
(defvar lsp-modeline--code-actions-string nil)

(setq-default mode-line-format
  '("%e"
	(:propertize " " display (raise +0.05)) ;; Top padding
	(:propertize " " display (raise -0.05)) ;; Bottom padding
	(:propertize "λ " face font-lock-comment-face)
	mode-line-frame-identification
	mode-line-buffer-identification

	;; Version control info
	(:eval (when-let (vc vc-mode)
			 ;; Use a pretty branch symbol in front of the branch name
			 (list (propertize "  B  " 'face 'font-lock-comment-face)
                   ;; Truncate branch name to 50 characters
				   (propertize (truncate-string-to-width
                                (substring vc 5) 50)
							   'face 'font-lock-comment-face))))

	;; Add space to align to the right
	(:eval (propertize
			 " " 'display
			 `((space :align-to
					  (-  (+ right right-fringe right-margin)
						 ,(+ 3
                             (string-width (or lsp-modeline--code-actions-string ""))
                             (string-width "%4l:3%c")))))))

    ;; LSP code actions
    (:eval (or lsp-modeline--code-actions-string ""))
	
	;; Line and column numbers
	(:propertize "%4l:%c" face mode-line-buffer-id)))

;; adaptive wrap
(use-package adaptive-wrap
  :defer t
  :hook (visual-line-mode . adaptive-wrap-prefix-mode))

;; writeroom mode: distraction free writing
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
(use-package crux
  :defer t
  :bind (:map custom-bindings-map
         ("C-S-<return>" . crux-smart-open-line-above)
         ("M-S-<down>"   . crux-duplicate-current-line-or-region)))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; completions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; use mx completion
(require 'amx)
(amx-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; search
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ripgrep
  :defer t)

(use-package rg
  :defer t)

(use-package ag
  :defer t)

(use-package wgrep
  :defer t)

;; use ripgrep as grep
(setq grep-command "rg -nS --no-heading "
      grep-use-null-device nil)

;; imenu list
(use-package imenu-list
  :defer t
  :bind (:map custom-bindings-map
              ("M-g i" . imenu-list-smart-toggle)))

;; marginalia
(use-package marginalia
  :init 
  (marginalia-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; version control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; magit

(use-package magit
  :defer t
  :bind ("C-x g" . magit-status))

;; git timemachine
(use-package git-timemachine
  :defer t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; misc.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; snippets
(use-package yasnippet
  :diminish yas-minor-mode
  :defer 5
  :config
  (setq yas-snippet-dirs '("~/.config/emacs/snippets/"))
  (yas-global-mode 1)) ;; or M-x yas-reload-all if you've started YASnippet already.

;; Silences the warning when running a snippet with backticks (runs a command in the snippet)
(require 'warnings)
(add-to-list 'warning-suppress-types '(yasnippet backquote-change))

;; pdf-tools: better pdf viewer
(use-package pdf-tools
  :defer t
  :init (pdf-loader-install)
  :hook ((pdf-view-mode . (lambda () (auto-revert-mode -1)))
         (pdf-view-mode . (lambda () (company-mode -1))))
  :bind (:map pdf-view-mode-map
              ("C-s"   . isearch-forward)
              ("C-M-s" . pdf-occur)))

;; Warn me when a PDF has been opened with the default DocView mode instead of PDF Tools’ PDF View mode.
(use-package doc-view
  :hook (doc-view-mode . (lambda ()
                           (display-warning
                            emacs
                            "Oops, using DocView instead of PDF Tools!"
                            :warning))))
;; epubs
(use-package nov
  :defer t
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

;; config profiling
(use-package esup
  :defer t
  :config
  (setq esup-depth 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org
  :defer t
  :hook (org-mode . olivetti-mode)
  :config
  ;; Resize Org headings
  (custom-set-faces
   '(org-document-title ((t (:height 1.6))))
   '(outline-1          ((t (:height 1.25))))
   '(outline-2          ((t (:height 1.2))))
   '(outline-3          ((t (:height 1.15))))
   '(outline-4          ((t (:height 1.1))))
   '(outline-5          ((t (:height 1.1))))
   '(outline-6          ((t (:height 1.1))))
   '(outline-8          ((t (:height 1.1))))
   '(outline-9          ((t (:height 1.1)))))
  ;; (setq org-startup-with-latex-preview t)
  (plist-put org-format-latex-options :scale 1.35)
  (let ((png (cdr (assoc 'dvipng org-preview-latex-process-alist))))
    (plist-put png :latex-compiler '("latex -interaction nonstopmode -output-directory %o %F"))
    (plist-put png :image-converter '("dvipng -D %D -T tight -o %O %F"))
    (plist-put png :transparent-image-converter '("dvipng -D %D -T tight -bg Transparent -o %O %F")))
  (setq org-startup-folded 'content)
  (setq org-adapt-indentation t
		org-hide-leading-stars t
		org-pretty-entities t
		org-ellipsis "  ·")
   ;; Some Org options to deal with headers and TODO’s nicely.
   (setq org-log-done                       t
       org-auto-align-tags                t
       org-tags-column                    -80
       org-fold-catch-invisible-edits     'show-and-error
       org-special-ctrl-a/e               t
       org-insert-heading-respect-content t)
   )

(use-package org-appear
  :commands (org-appear-mode)
  :hook     (org-mode . org-appear-mode)
  :config 
  (setq org-hide-emphasis-markers t)  ;; Must be activated for org-appear to work
  (setq org-appear-autoemphasis   t   ;; Show bold, italics, verbatim, etc.
        org-appear-autolinks      t   ;; Show links
        org-appear-autosubmarkers t))
;; Show sub- and superscripts

;; show inline images by default
(setq org-startup-with-inline-images t)

;; variable pitch: changes font in org mode
;;(add-hook 'org-mode-hook 'variable-pitch-mode)

;; latex fragtag
(use-package org-fragtog
  :after org
  :hook (org-mode . org-fragtog-mode))

;; org bullet stuff
(setq org-hide-leading-stars t)
;;(use-package org-bullets
;; :ensure t
;;  :after org
;;  :init
;; (add-hook 'org-mode-hook (lambda ()
;;                             (org-bullets-mode 1))))

(use-package org-superstar
  :after org
  :config
  (setq org-superstar-leading-bullet " ")
  (setq org-superstar-headline-bullets-list '("◆" "◇" "•" "⚬" "●" "○"))
;;  (setq org-superstar-special-todo-items t) ;; Makes TODO header bullets into boxes
  (setq org-superstar-todo-bullet-alist '(("TODO"  . 9744)
                                          ("PROG"  . 9744)
                                          ("NEXT"  . 9744)
                                          ("WAIT"  . 9744)
                                          ("DONE"  . 9745)))
  :hook (org-mode . org-superstar-mode))

;; right align tags
(add-to-list 'font-lock-extra-managed-props 'display)
`
;; Disable Electric Indent Mode
(add-hook 'org-mode-hook #'(lambda ()
							 (electric-indent-local-mode -1)))

;; opening links
(setq org-link-frame-setup
      '((vm      . vm-visit-folder-other-frame)
        (vm-imap . vm-visit-imap-folder-other-frame)
        (gnus    . org-gnus-no-new-news)
        (file    . find-file)
        (wl      . wl-other-frame)))
;; open links with return
(setq org-return-follows-link t)

(setq org-blank-before-new-entry '((heading . nil)
                                   (plain-list-item . nil)))

;; pasing images from clipboard
(use-package org-download
  :after org
  :bind
  (:map org-mode-map
        (("s-t" . org-download-screenshot)
         ("s-y" . org-download-clipboard))))

;; markdown compatible tables
(use-package toc-org
  :after org
  :config
  (add-hook 'org-mode-hook 'toc-org-mode)

  ;; enable in markdown, too
  (add-hook 'markdown-mode-hook 'toc-org-mode))
;; org-mode key bindings
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)


;; Custom keyboard shortcuts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; programming setups
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; language specific commenting: 

;; markdown mode
(use-package markdown-mode
  :defer t)

;; syntax checker
(use-package flycheck
  :defer t
  :init (global-flycheck-mode)
  :bind (:map flycheck-mode-map
              ("C-c ! !" . flycheck-explain-error-at-point))
  :config (setq flycheck-display-errors-function #'ignore))
;; 
;; documentation 
(use-package eldoc
  :defer t
  :config
  (global-eldoc-mode))

;; treesitter
(use-package treesit
  :ensure nil
  :mode (("\\.tsx\\'" . tsx-ts-mode)
         ("\\.js\\'"  . typescript-ts-mode)
         ("\\.mjs\\'" . typescript-ts-mode)
         ("\\.mts\\'" . typescript-ts-mode)
         ("\\.cjs\\'" . typescript-ts-mode)
         ("\\.ts\\'"  . typescript-ts-mode)
         ("\\.jsx\\'" . tsx-ts-mode)
         ("\\.json\\'" .  json-ts-mode)
         ("\\.Dockerfile\\'" . dockerfile-ts-mode)
         ("\\.prisma\\'" . prisma-ts-mode)
         ;; More modes defined here...
         )
  :preface
  (defun os/setup-install-grammars ()
    "Install Tree-sitter grammars if they are absent."
    (interactive)
    (dolist (grammar
             '((css . ("https://github.com/tree-sitter/tree-sitter-css" "v0.20.0"))
               (bash "https://github.com/tree-sitter/tree-sitter-bash")
               (html . ("https://github.com/tree-sitter/tree-sitter-html" "v0.20.1"))
               (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "v0.21.2" "src"))
               (json . ("https://github.com/tree-sitter/tree-sitter-json" "v0.20.2"))
               (python . ("https://github.com/tree-sitter/tree-sitter-python" "v0.20.4"))
               (go "https://github.com/tree-sitter/tree-sitter-go" "v0.20.0")
               (markdown "https://github.com/ikatyang/tree-sitter-markdown")
               (make "https://github.com/alemuller/tree-sitter-make")
               (elisp "https://github.com/Wilfred/tree-sitter-elisp")
               (cmake "https://github.com/uyha/tree-sitter-cmake")
               (c "https://github.com/tree-sitter/tree-sitter-c")
               (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
               (toml "https://github.com/tree-sitter/tree-sitter-toml")
               (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "tsx/src"))
               (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "typescript/src"))
               (yaml . ("https://github.com/ikatyang/tree-sitter-yaml" "v0.5.0"))
               (prisma "https://github.com/victorhqc/tree-sitter-prisma")))
      (add-to-list 'treesit-language-source-alist grammar)
      ;; Only install `grammar' if we don't already have it
      ;; installed. However, if you want to *update* a grammar then
      ;; this obviously prevents that from happening.
      (unless (treesit-language-available-p (car grammar))
        (treesit-install-language-grammar (car grammar)))))

  ;; Optional, but recommended. Tree-sitter enabled major modes are
  ;; distinct from their ordinary counterparts.
  ;;
  ;; You can remap major modes with `major-mode-remap-alist'. Note
  ;; that this does *not* extend to hooks! Make sure you migrate them
  ;; also
  (dolist (mapping
           '((Css-mode . css-ts-mode)
             (typescript-mode . typescript-ts-mode)
             (js-mode . typescript-ts-mode)
             (js2-mode . typescript-ts-mode)
             (css-mode . css-ts-mode)
             (json-mode . json-ts-mode)
             (js-json-mode . json-ts-mode)))
    (add-to-list 'major-mode-remap-alist mapping))
  :config
  (os/setup-install-grammars))

;; matching delimiters
(electric-pair-mode 1)

;; lispy/paredit
(use-package paredit
  :defer t
  :commands
  paredit-forward
  paredit-backward
  paredit-forward-up
  paredit-forward-down
  paredit-backward-up
  paredit-backward-down)

(use-package lispy
  :after paredit
  :hook (lispy-mode . (lambda () (electric-pair-local-mode -1)))
  :config
  (setcdr lispy-mode-map nil)
  :bind (:map lispy-mode-map

         ;; Basic editing
         ("("  . lispy-parens)
         (")"  . lispy-right-nostring)
         ("["  . lispy-brackets)
         ("]"  . lispy-close-square)
         ("{"  . lispy-braces)
         ("}"  . lispy-close-curly)
         (";"  . lispy-comment)
         ("\"" . paredit-doublequote)

         ;; Slurping & barfing
         ("C-<right>"   . paredit-forward-slurp-sexp)
         ("C-<left>"    . paredit-forward-barf-sexp)
         ("C-<right>"   . paredit-forward-slurp-sexp)
         ("C-<left>"    . paredit-forward-barf-sexp)

         ;; LISP-friendly Emacs commands
         ("C-k"        . lispy-kill)
         ("DEL"        . paredit-backward-delete)

         ;; Navigating sexpressions
         ("C-f"   . paredit-forward)
         ("C-b"   . paredit-backward)
         ("C-M-f" . paredit-forward-up)
         ("C-M-b" . paredit-backward-up)

         ("C-M-n" . paredit-forward-down)
         ("C-M-p" . paredit-backward-down)
         ("C-M-d" . paredit-forward-down)
         ("C-M-u" . paredit-backward-up)

         ("M-a"   . lispy-beginning-of-defun)
         ("M-d"   . lispy-different) ; Toggle between beginning and start of sexp

         ;; Moving sexpressions
         ("C-M-<up>"   . lispy-move-up)
         ("C-M-<down>" . lispy-move-down)
         ("M-c"        . lispy-clone)

         ;; Manipulating sexpressions
         ("M-<up>"   . lispy-splice-sexp-killing-backward)
         ("M-<down>" . lispy-splice-sexp-killing-forward)
         ("M-s"      . lispy-splice)
         ("M-r"      . lispy-raise-sexp)
         ("M-S"      . lispy-split)
         ("M-J"      . lispy-join)
         ("M-?"      . lispy-convolute)

         ;; Misc.
         ("M-\"" . lispy-meta-doublequote)
         ("M-)"  . lispy-close-round-and-newline)
         ("M-("  . lispy-wrap-round)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LSP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; language aware folding
(use-package origami
   :defer t
   :hook (prog-mode . origami-mode)
   :bind (:map origami-mode-map
               ("C-<" . origami-toggle-node)))

;; boost lsp: helps speed up LSP mode (and Eglot!) by converting JSON directly into elisp bytecode and by separating reading and writing into different threads.

(defun lsp-booster--advice-json-parse (old-fn &rest args)
  "Try to parse bytecode instead of json."
  (or
   (when (equal (following-char) ?#)
     (let ((bytecode (read (current-buffer))))
       (when (byte-code-function-p bytecode)
         (funcall bytecode))))
   (apply old-fn args)))
(advice-add (if (progn (require 'json)
                       (fboundp 'json-parse-buffer))
                'json-parse-buffer
              'json-read)
            :around
            #'lsp-booster--advice-json-parse)

(defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
  "Prepend emacs-lsp-booster command to lsp CMD."
  (let ((orig-result (funcall old-fn cmd test?)))
    (if (and (not test?)                             ;; for check lsp-server-present?
             (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
             lsp-use-plists
             (not (functionp 'json-rpc-connection))  ;; native json-rpc
             (executable-find "emacs-lsp-booster"))
        (progn
          (when-let ((command-from-exec-path (executable-find (car orig-result))))  ;; resolve command from exec-path (in case not found in $PATH)
            (setcar orig-result command-from-exec-path))
          (message "Using emacs-lsp-booster for %s!" orig-result)
          (cons "emacs-lsp-booster" orig-result))
      orig-result)))
(advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Programming Languages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Emacs Lisp: First, we need the holy trinity of Elisp libraries: dash (lists), s (strings), and f (files).
(use-package dash
  :defer t)

(use-package s
  :defer t)

(use-package f
  :defer t)

;; adding eros (evaluation Result Overlays) to enhance lisp evaluation
(use-package eros
  :defer t
  :functions
   eros-mode
   eros-eval-defun
   :bind (:map emacs-lisp-mode-map
               ("C-c C-c" . eros-eval-defun)
               ("C-c C-k" . eval-buffer))
   :config
   (eros-mode 1))

;; edit paren safely
 ;; (use-package emacs
   ;; :hook (emacs-lisp-mode . lispy-mode))

;; python3
(use-package python
  :interpreter ("python3" . python-mode)
  :defer t
  :config
  (setq python-shell-interpreter "python3.12")
  (add-hook 'python-mode
			 (lambda () (setq forward-sexp-function nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; custom keybindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; switch to previous/next buffer, so let’s rebind these handy functions.
(define-key custom-bindings-map (kbd "C-M-<left>")  'previous-buffer)
(define-key custom-bindings-map (kbd "C-M-<right>") 'next-buffer)

;; activate the keymap
(define-minor-mode custom-bindings-mode
  "A mode that activates custom keybindings."
  :init-value t
  :keymap custom-bindings-map)

;; load custom file
(load-file custom-file)
