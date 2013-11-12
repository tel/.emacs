(require 'key-chord)

(key-chord-mode 1)

(key-chord-define-global "jj" 'ace-jump-word-mode)
(key-chord-define-global "jk" 'ace-jump-char-mode)
(key-chord-define-global "JJ" 'prelude-switch-to-previous-buffer)
(key-chord-define-global "jl" 'ace-jump-line-mode)
