;;; -*- coding: utf-8-unix -*-

(defun convert-orgtbl-to-gfm ()
  "バッファ内のorgtblをGFMのテーブルに変換します。"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    ;; |----+-----+----|の行を見つけたら|----|-----|----|に置き換える
    (while (re-search-forward (rx bol (* (syntax whitespace)) "|" ;; 行頭 "|"
                                  (+ (+ "-") (group "+"))         ;; "---+ の連続 ("+" だけキャプチャ)
                                  (+ "-") "|"                     ;; 最後の列 "|"
                                  (* "\s") eol)                   ;; 行末
                              nil t)
        (replace-match (replace-regexp-in-string (rx "+") "|" (match-string-no-properties 0))))))

(defun my-markdown-hook ()
  (orgtbl-mode t)
  (add-hook 'before-save-hook
            'convert-orgtbl-to-gfm
            nil
            t    ;; buffer-local
            ))

(add-hook 'markdown-mode-hook 'my-markdown-hook)

