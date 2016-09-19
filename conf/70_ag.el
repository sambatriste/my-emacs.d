;;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

(use-package ag
  :config
  (custom-set-variables
   '(ag-highlight-search t)  ; 検索結果の中の検索語をハイライトする
   '(ag-reuse-window 'nil)   ; 現在のウィンドウを検索結果表示に使う
   '(ag-reuse-buffers 'nil)))

 ; 現在のバッファを検索結果表示に使う
(use-package wgrep-ag
  :config
  (autoload 'wgrep-ag-setup "wgrep-ag")
  (add-hook 'ag-mode-hook 'wgrep-ag-setup)
  ;; agの検索結果バッファで"r"で編集モードに。
  (define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode))


