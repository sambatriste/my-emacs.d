;;; -*- coding: utf-8-unix -*-


(defun my-enable-groovy-electric-mode ()
  (require 'groovy-electric)
  (groovy-electric-mode))

(use-package groovy-mode
  :config
  (add-hook 'groovy-mode-hook
            'my-enable-groovy-electric-mode))
