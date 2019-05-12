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

(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)))

(use-package evil-tabs
  :ensure t
  :init (global-evil-tabs-mode t))

(use-package evil-leader
  :ensure t
  :init (global-evil-leader-mode)
  :config
  (evil-leader/set-leader "SPC")
  (evil-leader/set-key
   "q" 'evil-quit
   "w" 'evil-write))


(use-package key-chord
  :ensure t
  :init (key-chord-mode t))
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(use-package doom-themes :ensure t)
(load-theme 'doom-city-lights t)

(use-package neotree :ensure t)

(use-package neotree
  :ensure t
  :config
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (add-hook 'neotree-mode-hook
	    (lambda ()
	      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	      (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
	      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
	      (define-key evil-normal-state-local-map (kbd "c d") 'neotree-change-root)
	      (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node))))

(global-set-key [f4] 'neotree-toggle)



(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-tabs use-package neotree markdown-mode helm evil-leader doom-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
