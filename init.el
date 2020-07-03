;; remember cursor position
(save-place-mode 1)

(transient-mark-mode 1)

;; final newline
(setq require-final-newline t)

;; get rid of trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; no tabs
(setq-default indent-tabs-mode nil)

;; disable the facade
(menu-bar-mode -1)
(setq inhibit-splash-screen t)
(setq initial-major-mode 'org-mode)

;; setup package.el
(package-initialize)
(require 'package)
(with-eval-after-load 'package
  (setq package-archives
	'(("melpa-stable" . "https://stable.melpa.org/packages/")
	  ("gnu" . "http://elpa.gnu.org.packages/"))))

(setq custom-file (expand-file-name "custom.el" "~/.emacs.d"))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)

;; magician for managing packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)

(eval-when-compile
  (require 'use-package))

;; setup custom modules path
(add-to-list 'load-path (expand-file-name "modules" "~/.emacs.d"))

(require 'theme)
(require 'line-number)
(require 'bash)
(require 'yaml)
;; (require 'ruby)
(require 'git)
