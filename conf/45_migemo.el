;;; -*- coding: utf-8-unix -*-
(use-package migemo
  :config
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  ;; platform independent settings.
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  ;;http://qiita.com/akisute3@github/items/bda92200f4a48ca89228
  (setq search-whitespace-regexp nil)
  (setq migemo-coding-system 'utf-8-unix)
  (setq migemo-options '("-q" "--emacs" "-i" "\a"))
  ;;(setq migemo-options '("-q" "--emacs"))
  (setq migemo-use-pattern-alist t)
  (setq migemo-use-frequent-pattern-alist t)
  (setq migemo-pattern-alist-length 1024)
  (migemo-init))
