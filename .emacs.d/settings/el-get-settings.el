; set the el-get path, and create it if it doesn't exist
(setq elget-path plugin-path)
(unless (file-exists-p elget-path)
  (make-directory elget-path))

;; block of code from official site
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
	       flycheck
               ;markdown-mode
               ;matlab-mode
               ;nxhtml
               ;pydoc-info
               ;scss-mode
               ;popup
               jedi
               nyan-mode
	       fill-column-indicator
               ;helm
               ;helm-descbinds
               ;js2-mode
               ;yasnippet
               ;yaml-mode
               ))

;; shallow git clone of repos
(setq el-get-git-shallow-clone t)

;; actual packages loading!
(el-get 'sync my-packages)


(provide 'el-get-settings)
