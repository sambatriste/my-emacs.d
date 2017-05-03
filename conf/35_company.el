;;; -*- coding: utf-8-unix -*-

(use-package company
  :diminish company-mode
  :config
  (global-company-mode)

  ;; company-dabbrevで日本語を補完しない
  ;; http://qiita.com/wktkshn/items/3ac46671d1c242a59f7e
  (defun edit-category-table-for-company-dabbrev (&optional table)
    (define-category ?s "word constituents for company-dabbrev" table)
    (let ((i 0))
      (while (< i 128)
        (if (equal ?w (char-syntax i))
            (modify-category-entry i ?s table)
          (modify-category-entry i ?s table t))
        (setq i (1+ i)))))
  (edit-category-table-for-company-dabbrev)
  (setq company-dabbrev-char-regexp "\\cs")
  
  (setq company-idle-delay 0.3
        company-minimum-prefix-length 4
        company-selection-wrap-around t
        ;; dabbrevで全て小文字になるのを防ぐ
        ;; http://tam5917.hatenablog.com/entry/2016/04/25/204532
        company-dabbrev-downcase nil)
  (bind-keys :map company-mode-map
             ("C-i" . company-complete))
  (bind-keys :map company-active-map
             ("C-n" . company-select-next)
             ("C-p" . company-select-previous)
             ("C-s" . company-search-words-regexp))
  (bind-keys :map company-search-map
             ("C-n" . company-select-next)
             ("C-p" . company-select-previous))
  (global-set-key (kbd "<tab>") 'indent-according-to-mode))


