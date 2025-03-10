;;;  -*- lexical-binding: t; -*-

(setq inhibit-startup-message t)
(setq visible-bell t)

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
  :ensure t
  :custom
  (straight-use-package-by-default t)
  :config
  (setq straight-use-package-by-default t))

;; -------------------------------------------------------------------
;; Language Server Protocol
;; -------------------------------------------------------------------

;; Configuration -----------------
(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-l")
  :hook ((python-mode nix-mode elisp-mode) . lsp)
  :config
  (lsp-enable-which-key-integration t)
  :commands lsp)

;; UI Mode
(use-package lsp-ui
  :config
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-header t)
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-doc-border (face-foreground 'default))
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-delay 0.05)
  :commands lsp-ui-mode)

;; helm symbol
(use-package helm-lsp :commands helm-lsp-workspace-symbol)

(use-package which-key
  :config
  (which-key-mode))

;; -------------------------------------------------------------------
;; Packages
;; -------------------------------------------------------------------

;; -------------------- Command log mode
(use-package command-log-mode)

;; -------------------- General: Better keybinding management
(use-package general
  :ensure t
  :config
  (general-auto-unbind-keys))

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

;; -------------------- Projectile
(use-package projectile
  :init
  (setq projectile-cleanup-known-projects t)
  (setq projectile-auto-discover t)
  :bind (("C-p" . projectile-command-map))
  :config
  (projectile-mode +1))

(use-package helm-projectile
  :config
  (helm-projectile-on))

;; -------------------- nix-mode
(use-package nix-mode
  :mode ("\\.nix\\'" "\\.nix.in\\'"))
(use-package nix-drv-mode
  :ensure nix-mode
  :mode "\\.drv\\'")
(use-package nix-shell
  :ensure nix-mode
  :commands (nix-shell-unpack nix-shell-configure nix-shell-build))
(use-package nix-repl
  :ensure nix-mode
  :commands (nix-repl))

(use-package lsp-nix
  :ensure lsp-mode
  :after (lsp-mode)
  :demand t
  :custom
  (lsp-nix-nil-formatter ["nixfmt"]))

;; -------------------- magit
(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; -------------------------------------------------------------------
;; Keymap
;; -------------------------------------------------------------------

;; Set cut, copy, paste and undo
(cua-mode)
(setq select-enable-clipboard t)

(general-define-key
 "C-q" 'save-buffers-kill-terminal ; exit emacs
 "C-s" 'save-buffer ; save current screen
 "C-a" "C-x h" ; select the whole buffer
 "C-Z" 'redo

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
 "C-<left>"  '(lambda () (interactive) (forward-same-syntax -1)))

;; -------------------------------------------------------------------
;; Accessiblity
;; -------------------------------------------------------------------

;; Enable mouse mode
(xterm-mouse-mode)

;; -------------------- Line numbers

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; -------------------- Rainbow Delimiters

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; -------------------------------------------------------------------
;; Themes
;; -------------------------------------------------------------------

(use-package catppuccin-theme
  :init (setq catppuccin-flavor 'macchiato)
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
