;;; -*- coding: utf-8-unix -*-

(use-package whitespace
  :diminish global-whitespace-mode
  :config
  (setq whitespace-style
        '(face
          ;trailing  ;行末
          tabs      ;タブ
          ;spaces   
          ;empty     ; 先頭/末尾の空行
          space-mark
          tab-mark))
  (setq whitespace-display-mappings
        '(
          ;(space-mark ?\u3000 [?\u25a1])
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
  (global-whitespace-mode 1))

