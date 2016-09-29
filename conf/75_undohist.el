;;; -*- coding: utf-8-unix -*-

(use-package undohist
  :config
  (undohist-initialize)
  (setq undohist-ignored-files
        '("COMMIT_EDITMSG")))
