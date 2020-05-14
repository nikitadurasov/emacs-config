;; path where settings files are kept
(add-to-list 'load-path "~/.emacs.d/settings")
;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")

;set the el-get path, and create it if it doesn't exist
(setq elget-path plugin-path)
(unless (file-exists-p elget-path)
    (make-directory elget-path))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

; packages to install
(setq 
 my-packages '(;auctex
               auto-complete
               color-theme-solarized
               ein
               magit
               ;markdown-mode
               ;matlab-mode
               ;nxhtml
               ;pydoc-info
               ;scss-mode
               ;popup
               jedi
               nyan-mode
               ;helm
               ;helm-descbinds
               ;js2-mode
               ;yasnippet
               ;yaml-mode
               ))

;; shallow git clone of repos
(setq el-get-git-shallow-clone t)

;; actual downloading
(el-get 'sync my-packages)


;; define various custom functions
(require 'custom-functions)

(require 'ido)
(ido-mode t)

;; Auto-complete
(setq ac-directory (make-elget-path "auto-complete"))
(add-to-list 'load-path ac-directory)
(require 'auto-complete) 

(require 'auto-complete-config) 
(ac-config-default)
;(global-auto-complete-mode t)

;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
		       (if (not (minibufferp (current-buffer)))
			   (auto-complete-mode 1))
		       ))
(real-global-auto-complete-mode t)

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

