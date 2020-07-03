(use-package company
  :ensure t
  :commands company-mode
  :config
  (require 'company)
  (require 'company-files)
  (global-company-mode)
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers nil)
  (push 'company-files company-backends)
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (require 'company-elisp)
              (push 'company-elisp company-backends))))

(provide 'completion)
