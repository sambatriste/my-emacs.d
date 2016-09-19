;(install-elisp-from-emacswiki "open-junk-file.el")
(when (require 'open-junk-file nil t)
  (global-set-key (kbd "C-x C-z") 'open-junk-file))
