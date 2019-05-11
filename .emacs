(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)

  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq visible-bell 1)

(use-package doom-themes :ensure t)
(load-theme 'doom-city-lights t)

(use-package helm :ensure t
  :config (helm-mode))
(use-package evil :ensure t
  :init
  :config 
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-insert-state-cursor '(bar "green")
        evil-normal-state-cursor '(box "lightblue")
        evil-visual-state-cursor '(hollow "orange")
        evil-motion-state-cursor '(box "green")
        evil-replace-state-cursor '(hbar "red"))
  (evil-mode))

(use-package evil-leader
  :ensure t
  :init (global-evil-leader-mode)
  :config
  (evil-leader/set-leader "SPC")
  (evil-leader/set-key
   "b" 'switch-to-buffer))

;(define-key evil-normal-state-map (kbd ", w") 'evil-window-vsplit)


(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
