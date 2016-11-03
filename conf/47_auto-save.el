;;; -*- coding: utf-8-unix -*-

(use-package super-save
  :config
  (setq super-save-auto-save-when-idle t
        super-save-idle-duration 10)
  (super-save-mode +1))
