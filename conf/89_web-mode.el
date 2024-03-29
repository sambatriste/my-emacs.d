;;; -*- coding: utf-8-unix -*-

(use-package web-mode
  :mode (("\\.html?\\'" . web-mode)
         ("\\.jsp\\'"   . web-mode)
         ("\\.tag\\'"   . web-mode)
         ("\\.js\\'"   . web-mode))
  :init
  (add-hook 'web-mode-hook '(lambda () (setq tab-width 2)))
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq indent-tabs-mode nil)
  
  (local-set-key (kbd "C-m") 'newline-and-indent)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-pairing t)
  ;; auto tag closing
  ;0=no auto-closing
  ;1=auto-close with </
  ;2=auto-close with > and </
  (setq web-mode-auto-close-style 2)
  (setq web-mode-auto-quote-style 2)
  (setq web-mode-tag-auto-close-style t)
  
  )


  
