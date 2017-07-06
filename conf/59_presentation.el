;;; -*- coding: utf-8-unix -*-

(use-package ox-reveal
  :config
  (setq org-reveal-root (concat "file:///" (expand-file-name "~/.emacs.d/lib/reveal.js/"))
        org-reveal-center nil))

(use-package htmlize)
