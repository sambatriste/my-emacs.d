;;; -*- coding: utf-8-unix -*-

(use-package company
  :diminish company-mode
  :config
  (global-company-mode)
  (setq company-idle-delay 0.3
        company-minimum-prefix-length 4
        company-selection-wrap-around t)
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

