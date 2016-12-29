;; FULLSCREEN
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq frame-title-format "emacs")

;; USE PACKAGE
(require 'package)

(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'diminish)
(require 'bind-key)


;; BACKUPS CONFIG
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)


;; DISABLE MENU/TOOL/SCROLLBAR
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


;; DISABLE WELCOME SCREEN
(setq inhibit-startup-screen t)


;; DISABLE SCRATCH MESSAGE
(setq initial-scratch-message "")


;; LINE NUMBERS
(global-linum-mode t)
(setq linum-delay t)


;; SMOOTH SCROLL
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq scroll-margin 5)


;; TRANSPARENT EDITOR
(set-frame-parameter (selected-frame) 'alpha '(75 . 50))
(add-to-list 'default-frame-alist '(alpha . (75 . 50)))


;; THEME
(use-package cyberpunk-theme
  :ensure t)


;; EVIL MODE (VIM CONTROLS)
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;;AUTO COMPLETE MODE
(use-package auto-complete
  :ensure t
  :defer t
  :config
  (global-auto-complete-mode t))



;; TERN AUTO COMPLETE
(use-package tern-auto-complete
  :ensure t
  :defer t
  :config)


;; TERN   make sure to npm install -g tern (dependency)
(use-package tern
  :ensure t
  :defer t
  :init
    (add-hook 'js-mode-hook (lambda () (tern-mode t)))
  :config
    (autoload 'tern-mode "tern.el" nil t)
    (tern-ac-setup))


;; EMMET MODE
(use-package emmet-mode
  :ensure t
  :defer t
  :init
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode))


;; WEB MODE
(use-package web-mode
  :ensure t
  :defer t
  :config
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (progn
      (setq web-mode-code-indent-offset 2)
      (setq web-mode-markup-indent-offset 2)))


;; AUTO GENERATED
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
