;;; -*- coding: utf-8-unix -*-
(use-package migemo
  :config
  (if (win?)
      ;;http://d.hatena.ne.jp/bobchin/20100831
      (let ((migemo-home (expand-file-name "lib/cmigemo-default-win64/" user-emacs-directory)))
        ;; https://github.com/mhatta/emacs-26-x86_64-win-ime/blob/master/README.md#おまけ-cmigemo
        (setq migemo-command (expand-file-name "cmigemo.exe" migemo-home ))
        (setq migemo-dictionary (expand-file-name "dict/utf-8/migemo-dict" migemo-home))))
  (if (mac?)
      (progn
        (setq migemo-command "/usr/local/bin/cmigemo")
        (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")))
  (if (arm?)
      (progn
        (setq migemo-command "/usr/bin/cmigemo")
        (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")))

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
  ;; この値を大きくするとexitが遅くなる。
  (setq migemo-pattern-alist-length 256)
  (migemo-init))
