;; -------------------------------------------------------------------
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

;; use-package using straight-use-package
(straight-use-package 'use-package)

;; set use-package as default
(use-package straight
  :custom
  (straight-use-package-by-default t))

;; -------------------------------------------------------------------
;; Auto update packages
;; -------------------------------------------------------------------

(use-package auto-package-update
  :init
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe))

;; -------------------------------------------------------------------
;; Language Server Protocol
;; -------------------------------------------------------------------

;; Configuration -----------------
(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-l")
  :hook (
	 ;; Python
	 (python-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; UI Mode
(use-package lsp-ui :commands lsp-ui-mode)

;; helm symbol
(use-package helm-lsp :commands helm-lsp-workspace-symbol)

(use-package which-key
    :config
    (which-key-mode))

;; -------------------------------------------------------------------
;; Packages
;; -------------------------------------------------------------------

;; -------------------- General: Better keybinding management
(use-package general)

;; -------------------- Projectile
(use-package projectile
  :ensure t
  :init
  (setq projectile-cleanup-known-projects t)
  (setq projectile-auto-discover t)
  :bind (("C-p" . projectile-command-map))
  :config
  (projectile-mode +1))

(use-package helm-projectile
  :config
  (helm-projectile-on))

;; -------------------- hydra
(use-package hydra)

;; -------------------- pyenv
(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode 1))

;; -------------------- Sublimity
(use-package sublimity
  :config
  (sublimity-mode 1))

;; -------------------- Dump Jump
(use-package dumb-jump
  :after
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

;; -------------------- Helm: Improved buffer & search packages
(use-package helm
  :config
  (helm-mode 1)
  :bind ("C-o" . 'helm-find-files))

;; -------------------- swiper-helm
(use-package swiper-helm
  :bind (("C-f" . swiper-helm)
	 :map swiper-helm-keymap
	 ("<tab>" . helm-next-line)
	 ("<backtab>" . helm-previous-line)))

;; -------------------------------------------------------------------
;; Keymap
;; -------------------------------------------------------------------

;; Set cut, copy, paste and undo
(cua-mode)
(setq select-enable-clipboard t)

(general-define-key
  "C-q" 'save-buffers-kill-terminal ; exit emacs
  "C-s" 'save-buffer ; save current screen

  ;; Swapping lines
  "M-<up>" '(lambda () (interactive) (transpose-lines -1))
  "M-<down>" 'transpose-lines)

;; Moving between windows
(general-define-key
  :prefix "C-x"
  "<up>"    'windmove-up
  "<down>"  'windmove-down
  "<left>"  'windmove-left
  "<right>" 'windmove-right)

;; Moving around text
(general-define-key
  "C-<right>" '(lambda () (interactive) (forward-same-syntax 1))
  "C-<left>"  '(lambda () (interactive) (forward-same-syntax -1))
 )

;; -------------------------------------------------------------------
;; Accessiblity
;; -------------------------------------------------------------------

;; Enable mouse mode
(xterm-mouse-mode)

;; -------------------------------------------------------------------
;; Themes
;; -------------------------------------------------------------------

(use-package catppuccin-theme
  :init (setq catppuccin-flavor 'latte)
  :config
  (load-theme 'catppuccin :no-confirm)
  (catppuccin-reload))

;; -------------------------------------------------------------------
;; Projects
;; -------------------------------------------------------------------

(dir-locals-set-class-variables 'agent-performance
   '((nil . ((pyvenv-activate . "~/go/src/repo.jazzdev.io/jazz/agent-performance/.venv")))))

(dir-locals-set-directory-class
   "~/go/src/repo.jazzdev.io/jazz/agent-performance" 'agent-performance)
