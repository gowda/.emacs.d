(use-package enh-ruby-mode
  :ensure t
  :mode
  (("Capfile" . enh-ruby-mode)
   ("Gemfile\\'" . enh-ruby-mode)
   ("Rakefile" . enh-ruby-mode)
   ("\\.rb" . enh-ruby-mode)
   ("\\.ru" . enh-ruby-mode)
   ("\\.rake" . enh-ruby-mode)))

(setq ruby-deep-indent-paren nil)

(use-package rvm
  :ensure t
  :commands rvm-activate-corresponding-ruby
  :init
  (add-hook 'enh-ruby-mode-hook
            (lambda ()
              (rvm-activate-corresponding-ruby))))

(use-package flymake-ruby
  :ensure t
  :commands flymake-ruby-load
  :init
  (add-hook 'enh-ruby-mode-hook 'flymake-ruby-load))

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
  :commands inf-ruby-minor-mode
  :init
  (add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
  :bind (:map inf-ruby-minor-mode-map
              ("C-c C-z" . 'switch-to-inf)))

(use-package ruby-end
  :ensure t
  :commands ruby-end-mode
  :custom
  (ruby-end-insert-newline nil))

(provide 'ruby)
