;;; -*- coding: utf-8-unix -*-

;; custom-file を custom.el に変更
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
