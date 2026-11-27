;; Packages
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

;; UI
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq inhibit-startup-message t
      initial-scratch-message ";; Happy hacking!\n")

(line-number-mode 1)
(column-number-mode 1)
(show-paren-mode 1)

;; Files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

;; Completion
(fido-mode 1)

;; Editing
(setq-default indent-tabs-mode nil
              tab-width 4
              truncate-lines nil)

(electric-pair-mode 1)
(save-place-mode 1)

(add-hook 'before-save-hook
          #'delete-trailing-whitespace)

;; Python
(defun setup-python-indentation ()
  (setq-local indent-tabs-mode nil
              tab-width 4
              python-indent-offset 4))

(add-hook 'python-mode-hook
          #'setup-python-indentation)

(add-hook 'python-ts-mode-hook
          #'setup-python-indentation)

;; Nael
(use-package nael
  :mode ("\\.lean\\'" . nael-mode))
