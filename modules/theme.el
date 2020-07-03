(defun github-clone (repo &optional root)
  (let* ((dst (expand-file-name (file-name-base repo) root))
         (url (concat "git@github.com" ":" repo)))
    (call-process "git" nil "*initializer*" t "clone" url dst)))

(let ((theme-directory (expand-file-name "~/.emacs.d/themes")))
  (unless (file-directory-p theme-directory)
    (make-directory theme-directory :parents))

  (github-clone "sellout/emacs-color-theme-solarized.git" theme-directory)

  (dolist (f (directory-files theme-directory))
    (if (and (not (or (equal f ".")
                      (equal f "..")))
             (file-directory-p (expand-file-name f theme-directory)))
        (add-to-list 'custom-theme-load-path
                     (expand-file-name f theme-directory)))))

(load-theme 'solarized t)
(set-terminal-parameter nil 'background-mode 'dark)

(provide 'theme)
