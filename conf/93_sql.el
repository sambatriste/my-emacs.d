;;; -*- coding: utf-8-unix -*-


;;http://haraita9283.blog98.fc2.com/blog-entry-397.html
;;SQLを整形する
(defvar anbt-sql-formatter:formatter-path
  "~/.emacs.d/lib/anbt-sql-formatter-master/bin/anbt-sql-formatter")
(defun anbt-sql-formatter:format ()
  "Format SQL on specified region."
  (interactive)

  (let ((beg)
        (end))
    (if mark-active
        (setq beg (region-beginning)
              end (region-end))
      (setq beg (point-min)
            end (point-max)))
    (save-excursion
      (shell-command-on-region
       beg end
       (format "ruby %s" (expand-file-name anbt-sql-formatter:formatter-path)) nil t))))
(add-hook 'sql-mode-hook
          (lambda ()
            (define-key sql-mode-map (kbd "C-S-f") 'anbt-sql-formatter:format)))


;; sql-modeの文字化け対策
(add-hook 'sql-interactive-mode-hook
          (function (lambda ()
                      (set-buffer-process-coding-system 'utf-8-nfd 'utf-8-nfd))))
