;; -------------------------------------------------------------------
;; Package Manager
;; -------------------------------------------------------------------
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;; -------------------------------------------------------------------
;; Keymap
;; -------------------------------------------------------------------

;; Undo
(keymap-global-set "C-z" 'undo)

;; Save current screen
(keymap-global-set "C-s" 'save-buffer)

;; Opening files and folders
(keymap-global-set "C-o" 'find-file)

;; Copy and Paste
(keymap-global-set "C-c" 'kill-ring-save)
(keymap-global-set "C-v" 'clipboard-yank)

;; Searching within window
(keymap-global-set "C-f" 'isearch-forward)

;; -------------------------------------------------------------------
;; Themes
;; -------------------------------------------------------------------

(straight-use-package 'catppuccin-theme)

;; Catppuccin theme
(load-theme 'catppuccin)
(setq catppuccin-flavor 'latte)
(catppuccin-reload)
