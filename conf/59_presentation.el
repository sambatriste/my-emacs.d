

(use-package org-present)

(use-package ox-reveal
  :config
  (setq org-reveal-root (concat "file:///" (expand-file-name "~/.emacs.d/lib/reveal.js/"))
        org-reveal-center nil)
  
  )

