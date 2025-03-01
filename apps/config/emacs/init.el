; -------------------------------------------------------------------
; Keymap
; -------------------------------------------------------------------


(keymap-global-set "C-z" 'undo)
; Copy and Paste
(keymap-global-set "C-c" 'kill-ring-save)
(keymap-global-set "C-v" 'clipboard-yank)

;searching within window
(keymap-global-set "C-f" 'isearch-forward)
