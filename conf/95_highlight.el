;;; -*- coding: utf-8-unix -*-
(use-package highlight-symbol
  :config
  ;;(setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1")) ;; 使いたい色を設定、repeatしてくれる
  
  ;; 適宜keybindの設定
  (global-set-key (kbd "<f3>") 'highlight-symbol-at-point)
;  (global-set-key (kbd "M-<f3>") 'highlight-symbol-remove-all)

  (global-set-key [(control f3)] 'highlight-symbol-next)
;(global-set-key [f3] 'highlight-symbol-next)
  (global-set-key [(shift f3)] 'highlight-symbol-prev)
  (global-set-key [(meta f3)] 'highlight-symbol-query-replace))

