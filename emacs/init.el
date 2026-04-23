;;; 2026-04-20 https://www.philnewton.net/blog/minimal-emacs-config/

;; Maximize window when frame opens.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;; 2026-04-19 https://linux-tips.com/t/disabling-emacs-splash-screen/211

;; disable splash screen and startup message
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)

;;; 2026-04-19 https://www.sandeepnambiar.com/my-minimal-emacs-setup/

;; UTF-8 is preferred everywhere.
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; clean look
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

;; visual helpers
(global-hl-line-mode +1)
(line-number-mode +1)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)

;(set-frame-font "LXGW Bright Code GB 14" nil t)

;; backups
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(fset 'yes-or-no-p 'y-or-n-p)

;; reload the file automatically
(global-auto-revert-mode t)

;; don't use tabs for indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; kill the current buffer
;; bug#71510: 30.0.50; kill-this-buffer must be bound to an event with para
;; https://lists.gnu.org/archive/html/bug-gnu-emacs/2024-06/msg00967.html
;(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;;; 2022-10-16 https://mirrors.ustc.edu.cn/help/elpa.html

(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("nongnu" . "http://mirrors.ustc.edu.cn/elpa/nongnu/")))

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;(package-refresh-contents)

;;; 2026-04-20 https://www.masteringemacs.org/article/unicode-ligatures-color-emoji

(use-package unicode-fonts
   :ensure t
   :config
   (unicode-fonts-setup))

;;; Eglot https://wiki.archlinux.org/title/Emacs
(add-hook 'prog-mode-hook 'eglot-ensure)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
