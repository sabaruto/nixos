
;; Package Manager
;; -------------------------------------------------------------------

;; Straight packager manager
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

;; Set cut, copy, paste and undo
(cua-mode)
(setq select-enable-clipboard t)

;; Exit Emacs
(keymap-global-unset "C-q")
(keymap-global-set "C-q" 'save-buffers-kill-terminal)

;; Save current screen
(keymap-global-set "C-s" 'save-buffer)

;; Opening files and folders
(keymap-global-set "C-o" 'find-file)

;; Searching within window
(keymap-global-set "C-f" 'isearch-forward)

;; Moving between windows
(keymap-global-set "C-x <up>" 'windmove-up)
(keymap-global-set "C-x <down>" 'windmove-down)
(keymap-global-set "C-x <left>" 'windmove-left)
(keymap-global-set "C-x <right>" 'windmove-right)


;; Swapping lines
(keymap-global-set "M-<up>"
		   (lambda ()
		     (interactive)
		     (transpose-lines -1)))

(keymap-global-set "M-<down>" 'transpose-lines)

;; -------------------------------------------------------------------
;; Accessiblity
;; -------------------------------------------------------------------

;; Enable mouse mode
(xterm-mouse-mode)

;; Helm: Improved buffer & search packages
(straight-use-package 'helm)
(helm-mode 1)

;; -------------------------------------------------------------------
;; Themes
;; -------------------------------------------------------------------

(straight-use-package 'catppuccin-theme)

;; Catppuccin theme
(load-theme 'catppuccin :no-confirm)

(setq catppuccin-flavor 'latte)
(catppuccin-reload)
