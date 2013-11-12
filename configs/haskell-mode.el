(add-hook 'haskell-mode-hook (lambda () 
                               (ghc-init)
                               (flymake-mode)))
(add-hook 'haskell-mode-hook 'turn-on-haskell-unicode-input-method)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(define-key haskell-mode-map (kbd "C-c c") 'ghc-core-create-core)

(eval-after-load "haskell-cabal"
  '(progn
     (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile)))

(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)
  
     (define-key haskell-mode-map (kbd "C-c v c") 'haskell-cabal-visit-file)
   
     (define-key haskell-mode-map (kbd "C-x C-d") nil)
     (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
     (define-key haskell-mode-map (kbd "C-c C-b") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c M-.") nil)
     (define-key haskell-mode-map (kbd "C-c C-d") nil)))
