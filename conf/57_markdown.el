;;; -*- coding: utf-8-unix -*-

(defun convert-orgtbl-to-gfm ()
  "バッファ内のorgtblをGFMのテーブルに変換します。"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    ;; |----+-----+----|の行を見つけたら|----|-----|----|に置き換える
    (while (re-search-forward "^\s*|\\(-+\\(\\+\\)\\)+-+|\s*$" nil t)
      (let ((end (point))
            (begin (point-at-bol)))
        (replace-string "+" "|" nil begin end)))))
(defun my-markdown-hook ()
  (orgtbl-mode t)
  (add-hook 'before-save-hook
            'convert-orgtbl-to-gfm
            nil
            t    ;; buffer-local
            ))

(add-hook 'markdown-mode-hook 'my-markdown-hook)

