;;; -*- coding: utf-8-unix -*-


;;http://haraita9283.blog98.fc2.com/blog-entry-397.html
;;SQLを整形する
(defvar anbt-sql-formatter:formatter-path
  "~/.emacs.d/lib/anbt-sql-formatter-master/bin/anbt-sql-formatter")
(defun anbt-sql-formatter:format ()
  "Format SQL on specified region."
  (interactive)
  (destructuring-bind (begin end)
      (if mark-active
          (list (region-beginning) (region-end))
        (list (point-min) (point-max)))
    (format-sql begin end)))

(defun format-sql (begin end)
  (save-excursion
    (shell-command-on-region
     begin
     end
     (format "ruby %s" (expand-file-name anbt-sql-formatter:formatter-path)) nil t)))

(add-hook 'sql-mode-hook
          (lambda ()
            (define-key sql-mode-map (kbd "C-S-f") 'anbt-sql-formatter:format)))

;; sql-modeの文字化け対策
(add-hook 'sql-interactive-mode-hook
          (function (lambda ()
                      (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))
