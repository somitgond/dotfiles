(setq custom-file "~/.config/emacs/custom.el")

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 0)
(setq-default tab-width 2)
(setq inhibit-startup-message t)  ; Comment at end of line!

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)

(load-theme 'gruber-darker t)

(setq use-short-answers t)     ; so that yes/no questions in the minibuffer can be answered using y/n
(setq-default tab-width 4)     ; make default tab spacing 4
(delete-selection-mode 1)      ; select text and automatically overwrite without typing backspace
(setq browse-url-generic-program "xdg-open") ; open URLs in the default web browser (not EWW) using XDG's util


;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
;; (package-initialize)
;; (package-refresh-contents)

;; Enable Evil
(use-package evil
		 :init
		 (evil-mode 1))

;; doom modeline 
(use-package doom-modeline
  :init
  (doom-modeline-mode 1))

;; orderless 
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

;; from here: https://kristofferbalintona.me/posts/202202211546/
(use-package marginalia
  :ensure t
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



;; Enable Vertico.
(use-package vertico
  :ensure t
  :custom
  (vertico-scroll-margin 0) ;; Different scroll margin
  (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  :init
  (vertico-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))
