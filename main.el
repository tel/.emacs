
;; main emacs config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; * Assumes only that dotpath and homepath have been defined


;; Basic file handling
;; -----------------------------------------------------------------------------

(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Global behavior
;; -----------------------------------------------------------------------------

(setq inhibit-splash-screen t
      visible-bell          t
      transient-mark-mode   t)
(global-auto-revert-mode)


;; Other early initialization files
;; -----------------------------------------------------------------------------

(load-file (dotpath "custom.el"))     ;; keyboard tweaks
(load-file (dotpath "automode.el"))   ;; full auto-mode alist


;; Eval-after-load package configuration
;; -----------------------------------------------------------------------------

(load-file (dotpath "configs/org.el"))
(load-file (dotpath "configs/tramp.el"))

;; Package management
;; -----------------------------------------------------------------------------

(require 'package)
(setq package-archives '(("elpa"      . "http://tromey.com/elpa/")
                         ("melpa"     . "http://melpa.milkbox.net/packages/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (package '( 
		   
		   ;; Basics
		   color-theme
		   ido-ubiquitous
           pkg-info
           ack-and-a-half
		   ace-jump-mode           ;; C-c SPC
           key-chord               ;; jj and such
		   anzu                    ;; incremental search highlighting
		   gist
           projectile              ;; project searches
           dash                    ;; text search library
           s
		   helm helm-projectile helm-ack helm-ls-git
		   rainbow-mode            ;; color highlights for #abccba
		   smex                    ;; "smart M-x"
		   smartparens             ;; paredit++
		   undo-tree               ;; sophisticated undo
		   volatile-highlights     ;; highlights for changes
		   flymake

		   ;; Syntax helpers
		   json-mode

		   ;; Major modes
		   auctex
		   markdown-mode
		   haskell-mode ghc hi2
		   clojure-mode clojure-test-mode nrepl
		   lua-mode
		   go-mode
		   python-mode

		   magit git-commit-mode
                 git-rebase-mode
                 gitconfig-mode
                 gitignore-mode
		   ))
  (when (not (package-installed-p package)) (package-install package))

  ;; If configs/<package name>.el exists, load it as a config file
  (let ((config-file (dotpath (concat "configs/" (symbol-name package) ".el"))))
    (when (file-exists-p config-file) 
      (load-file config-file))))

;; Manual Packages
;; -----------------------------------------------------------------------------

(add-to-list 'load-path (dotpath "loads/"))
(add-to-list 'load-path (dotpath "configs/"))
(require 'opa-mode-load)
(require 'opa-mode)

;; Autosaves
;; -----------------------------------------------------------------------------

(defvar autosave-dir (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))

(defun make-autosave-dir (&optional x) (make-directory autosave-dir t))

(make-autosave-dir)

(setq auto-save-file-name-transforms 
      `(("\\(?:[^/]*/\\)*\\(.*\\)" ,(concat
				     autosave-dir "\\1") t)))
(add-hook 'auto-save-hook 'make-autosave-dir)

(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))


;; Colors, fonts, and general appearance
;; -----------------------------------------------------------------------------

(when (fboundp 'global-font-lock-mode) (global-font-lock-mode t))
(setq transient-mark-mode   t
      frame-title-format    (concat  "%b - emacs@" (system-name))
      diff-switches         "-u")

(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(if (fboundp 'fringe-mode)
    (fringe-mode 4))

(fset 'yes-or-no-p 'y-or-n-p)

(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)

(custom-set-faces '(default ((t (:background "black" 
				 :foreground "white"
				 :inherit nil
				 :stipple nil
				 :inverse-video nil
				 :box nil
				 :strike-through nil
				 :overline nil
				 :underline nil
				 :slant normal
				 :weight normal
				 :height 140
				 :width normal
				 :family "Inconsolata")))))

(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(set-frame-parameter nil 'fullscreen 'fullboth)

;; Basic start
;; -----------------------------------------------------------------------------

(server-start)
(shell)
