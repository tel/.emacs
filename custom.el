
;; My own strange customizations // Totally annoying to everyone except me
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(dolist (assgn '( 

		 ;; Make M-x easier to hit
		 ("C-x C-m" . execute-extended-command)
		 ("C-x m"   . execute-extended-command)
		 ("C-c C-m" . execute-extended-command)
		 
		 ;; Make backwards-kill-word easier
		 ("C-w"     . backward-kill-word)
		 ("C-x C-k" . kill-region)
		 ("C-c C-k" . kill-region)
		 
		 ;; Changing text sizes
		 ("C-+"     . text-scale-increase)
		 ("C--"     . text-scale-decrease)
		 
		 ;; Window/buffer management
		 ("C-x 4 r" . rotate-windows)
		 ("C-x M-f" . ido-find-file-other-window)
		 ("C-x f"   . refentf-ido-find-file)
		 ("C-c y"   . bury-buffer)
		 ("C-x C-b" . ibuffer)

		 ))
  (global-set-key (kbd (car assgn)) (cdr assgn)))

(defalias 'qrr 'query-replace-regexp)
(defalias 'ar  'align-regexp)

;; Custom function definitions
;; -----------------------------------------------------------------------------

(defun rotate-windows ()
  "Rotate your windows" 
  (interactive)
  (cond ((not (> (count-windows) 1)) (message "You can't rotate a single window!"))
	(t (setq i 1)
	   (setq numWindows (count-windows))
	   (while  (< i numWindows)
	     (let* ((w1 (elt (window-list) i))
		    (w2 (elt (window-list) (+ (% i numWindows) 1)))
		    (b1 (window-buffer w1))
		    (b2 (window-buffer w2))
		    (s1 (window-start w1))
		    (s2 (window-start w2)))
	       (set-window-buffer w1  b2)
	       (set-window-buffer w2 b1)
	       (set-window-start w1 s2)
	       (set-window-start w2 s1)
	       (setq i (1+ i)))))))
