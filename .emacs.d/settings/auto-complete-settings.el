;; Auto-complete
(setq ac-directory (make-elget-path "auto-complete"))
(add-to-list 'load-path ac-directory)
(require 'auto-complete) 

(require 'auto-complete-config) 
(ac-config-default)

;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
		       (if (not (minibufferp (current-buffer)))
			   (auto-complete-mode 1))
		       ))
(real-global-auto-complete-mode t)

(provide 'auto-complete-settings)
