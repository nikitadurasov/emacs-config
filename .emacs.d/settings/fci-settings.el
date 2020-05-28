;; dirty fix for having fci everywhere
(define-globalized-minor-mode global-fci-mode
  fci-mode (lambda ()
	     (fci-mode 1)
	     ))
(global-fci-mode t)

;; setting line to 79 characters
(setq fci-rule-width 79)

;; make this line 1 px width
(setq fci-rule-width 1)

;; make this line darkblue
(setq fci-rule-color "darkblue")

(provide 'fci-settings)

