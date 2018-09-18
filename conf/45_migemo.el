;;; -*- coding: utf-8-unix -*-
(use-package migemo
  :config
  (if (win?)
      ;;http://d.hatena.ne.jp/bobchin/20100831
      (progn
        ;; https://github.com/mhatta/emacs-26-x86_64-win-ime/blob/master/README.md#おまけ-cmigemo
        (setq migemo-command "C:/tools/cmigemo-1.3-mingw64-20180629/cmigemo.exe")
        (setq migemo-dictionary "C:/tools/cmigemo-1.3-mingw64-20180629/dict/utf-8/migemo-dict" )))
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
  ;;(setq migemo-pattern-alist-length 256)
  (migemo-init))
