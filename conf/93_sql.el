;;; -*- coding: utf-8-unix -*-

;;; SQL文の整形をする設定
(setq sql-format-external-command
  (concat "java -jar " (expand-file-name "~/.emacs.d/lib/sql-formatter-1.0.0-jar-with-dependencies.jar")))
;; SQL文をフォーマットする関数
(defun my-format-sql ()
  "バッファまたはリージョン内のSQL文を整形する。"
  (interactive)
  (let (begin end)
    (cond (mark-active
           (setq begin (region-beginning))
           (setq end (region-end)))
          (t
           (setq begin (point-min))
           (setq end (point-max))))
    (save-excursion
      (shell-command-on-region
       begin
       end
       sql-format-external-command
       nil 
       t ; replace buffer
       ))))

(with-eval-after-load "sql"
  (define-key sql-mode-map (kbd "C-S-f") 'my-format-sql))




;; sql-modeの文字化け対策
(add-hook 'sql-interactive-mode-hook
          (function (lambda ()
                      (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))
