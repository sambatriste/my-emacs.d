;;; -*- coding: utf-8-unix -*-

(use-package groovy-mode
  :config
  (add-hook 'groovy-mode-hook
            '(lambda ()
               (require 'groovy-electric)
               (groovy-electric-mode))))
