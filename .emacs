(setq custom-file "~/.emacs.custom.el")


; setting custom fonts
(add-to-list 'default-frame-alist `(font . "Iosevka-13"))
;(set-frame-font "Iosevka 14" nil t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(ido-mode 1)

(global-display-line-numbers-mode)

; adding melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(load-file custom-file)
