;;; package --- summary
;;; Commentary:
;;; Code:

;; Package manager
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(setq package-enable-at-startup nil)

;; Activate installed packages
(package-initialize)

(defun ensure-package-installed (&rest packages)
  "Assure every PACKAGES is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
	 nil
       (if (y-or-n-p (format "Package %s is missing.  Install it? " package))
	   (package-install package)
	 package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Packages you want to ensure to install
(ensure-package-installed 'aggressive-indent
			  'apache-mode
			  'back-button
			  'company
			  'elscreen
			  'evil
			  'flycheck
			  'flx-ido
			  'js2-mode
			  'magit
			  'multi-term
			  'neotree
			  'php-mode
			  'projectile
			  'smartparens
			  'smex
			  'syslog-mode
			  'tdd
			  'whitespace-cleanup-mode
			  'zenburn-theme)

;; Add to PATH for emacs env
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

;; Swap mac command and option keys for Meta
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; Backward-kill-word to C-w
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; Remove UI
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Show line numbers
(global-linum-mode t)

;; Evil-mode
(require 'evil)
(evil-mode 1)
(setq evil-default-state 'emacs) ; start evil-mode in emacs mode.  Only toggle on with C-z
(add-to-list 'evil-emacs-state-modes 'undo-tree-mode)

;; ElScreen
(require 'elscreen)
(setq elscreen-prefix-key "\C-c\z")
(setq elscreen-display-tab 'nil)
(elscreen-start)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq-default indent-tabs-mode nil)

;; flycheck-mode
(add-hook 'after-init-hook #'global-flycheck-mode)
;; Aggressive Indent Mode https://github.com/Malabarba/aggressive-indent-mode
(global-aggressive-indent-mode)
;;Example if I want to exclude certain modes (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;;whitespace-cleanup-mode
(global-whitespace-cleanup-mode)

;; Smartparens
(smartparens-global-mode t)

;; company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; Start IDO
(require 'ido)
(ido-mode t)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; Start smex
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Projectile
(require 'projectile)
(projectile-global-mode)

;; Neotree set to projectile
(require 'neotree)
(setq neo-theme 'ascii)
(setq projectile-switch-project-action 'neotree-projectile-action)
(global-set-key [f8] 'neotree-toggle)

;; Back Button
(require 'back-button)
(back-button-mode 1)

;; PHP Mode
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.engine$" . php-mode))

;; Function to show ansi colour in compilation buffer
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; Load zenburn theme
(load-theme 'zenburn t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "95a6ac1b01dcaed4175946b581461e16e1b909d354ada79770c0821e491067c6" default)))
 '(flx-ido-mode t)
 '(global-aggressive-indent-mode t)
 '(global-company-mode t)
 '(js2-basic-offset 4)
 '(js2-bounce-indent-p t)
 '(smartparens-global-mode t)
 '(tab-width 4)
 '(tdd-mode t))

(provide '.emacs)
;;; .emacs ends here
