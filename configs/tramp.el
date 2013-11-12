(require 'tramp)
(require 'tramp-sh)


(setq tramp-default-method         "ssh"
      tramp-shell-prompt-pattern   "^[^$>\n\[\]]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*"
      auto-compression-mode        t
      tramp-chunksize              500)

;; Nix specific configuration
;; -----------------------------------------------------------------------------

(setq tramp-remote-path (append tramp-remote-path '(tramp-own-remote-path)))

(add-to-list 'tramp-remote-path "/run/current-system/sw/bin")
