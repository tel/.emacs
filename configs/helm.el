(helm-mode 1)
(global-set-key (kbd "C-c h") 'helm-mini)
(define-key helm-map (kbd "C-d") 'helm-execute-persistent-action)

(setq helm-ff-transformer-show-only-basename   nil
      helm-ls-git-show-abs-or-relative         'relative)
