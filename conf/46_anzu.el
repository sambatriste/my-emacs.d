;;; -*- coding: utf-8-unix -*-

(use-package anzu
  :diminish anzu-mode
  :config
  (global-anzu-mode +1)
  (setq anzu-use-migemo t
        anzu-search-threshold 1000
        anzu-replace-threshold 50)
  (define-key isearch-mode-map [remap isearch-query-replace]  #'anzu-isearch-query-replace)
  (define-key isearch-mode-map [remap isearch-query-replace-regexp] #'anzu-isearch-query-replace-regexp))
