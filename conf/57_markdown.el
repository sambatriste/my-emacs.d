;;; -*- coding: utf-8-unix -*-

(use-package markdown-mode
  :config
  (bind-keys :map markdown-mode-map
             ("<tab>" . markdown-cycle)
             ("<S-tab>" . markdown-shifttab)
             ("C-M-n" . outline-next-visible-heading)
             ("C-M-p" . outline-previous-visible-heading))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
  ;; Pandocの設定
  ;; http://qiita.com/syogi_wap/items/53947998da905e8b87a8
  (let* ((pandoc-home (cond
                       ((win?) (expand-file-name "~/AppData/Local/Pandoc/"))))
         (pandoc-bin (expand-file-name (concat pandoc-home "pandoc.exe")))
         (css (concat pandoc-home "github.css")))
    (setq markdown-command 
          (concat pandoc-bin " -s --self-contained -t html5 -c" css)))

  ;; GFMへのテーブル変換
  ;; http://qiita.com/sambatriste/items/dd4a2223cb02021ecdca
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
  (add-hook 'gfm-mode-hook 'my-markdown-hook)
  )





