(setq ruby-deep-indent-paren nil)

(use-package rvm :ensure t
  :init
  (rvm-use-default))

(use-package flymake-ruby
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'flymake-ruby-load))

(defun switch-to-inf ()
  "Switch to the ruby process, create one if none exists"
  (interactive)
  (let* ((impl "ruby")
         (command (cdr (assoc impl inf-ruby-implementations))))
    (when (functionp command)
      (setq command (funcall command)))
    (run-ruby command impl)))

(use-package inf-ruby
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
  :bind (:map inf-ruby-minor-mode-map
              ("C-c C-z" . 'switch-to-inf)))

(provide 'ruby)
