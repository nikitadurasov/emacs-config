;; path where settings files are kept
(add-to-list 'load-path "~/.emacs.d/settings")
;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")

;; define various custom functions
(require 'custom-functions)

;; define el-get settings
(require 'el-get-settings)

;; define auto-complete settings
(require 'auto-complete-settings)

;; define theme styling
(require 'color-scheme-settings)

(require 'ido)
(ido-mode t)

;; dirty fix for having fci everywhere
(define-globalized-minor-mode global-fci-mode
  fci-mode (lambda ()
	     (fci-mode 1)
	     ))
(global-fci-mode t)

;; dirty fix for having fci everywhere
(define-globalized-minor-mode global-fci-mode
  fci-mode (lambda ()
	     (fci-mode 1)
	     ))
(global-fci-mode t)

(nyan-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

