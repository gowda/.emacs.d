;; line numbers in margin
(add-hook 'find-file-hook (lambda () (linum-mode 1)))

(eval-after-load 'linum
  '(progn
     (set-face-foreground 'linum "#4f4f4f")
     (set-face-background 'linum nil)
     (defun linum-format-func (line)
       (let ((w (length
		 (number-to-string (count-lines (point-min) (point-max))))))
	 (concat
	  (propertize (make-string (- w (length (number-to-string line))) ?0)
		      'face 'linum)
	  (propertize (number-to-string line) 'face 'linum)
	  (propertize "\u2502 " 'face 'linum))))

     (setq linum-format 'linum-format-func)))

(provide 'line-number)
