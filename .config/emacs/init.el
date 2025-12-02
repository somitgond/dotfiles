
;; This file replaces itself with the actual configuration at first run.

;; We can't tangle without org!
(require 'org)
;; Open the configuration
(org-babel-load-file (concat user-emacs-directory "config.org"))
;; finally byte-compile it
(byte-compile-file (concat user-emacs-directory "config.el"))

