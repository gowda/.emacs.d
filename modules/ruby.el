(defun setup-compile-command ()
  (progn
    ;;; Local Variables:
    ;;; byte-compile-warnings: (not free-vars)
    ;;; End:
    (set (make-local-variable 'compilation-read-command) nil)
    (if buffer-file-name
        (progn
          (add-hook 'compilation-filter-hook
                    (lambda ()
                      (ansi-color-apply-on-region
                       compilation-filter-start
                       (point-max))))
          (set (make-local-variable 'compile-command)
               (concat "ruby " buffer-file-name)))
      (set (make-local-variable 'compile-command)
           "echo 'Save the buffer to a file before running'"))))

(use-package enh-ruby-mode
  :ensure t
  :mode
  (("Capfile" . enh-ruby-mode)
   ("Gemfile\\'" . enh-ruby-mode)
   ("Rakefile" . enh-ruby-mode)
   ("\\.rb\\'" . enh-ruby-mode)
   ("\\.ru\\'" . enh-ruby-mode)
   ("\\.rake\\'" . enh-ruby-mode))
  :init
  (add-hook 'enh-ruby-mode-hook #'setup-compile-command)
  :bind (("C-c r" . compile)))

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
