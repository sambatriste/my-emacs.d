;;; -*- coding: utf-8-unix -*-

(use-package magit
  :config
  ;;http://www.greenwood.co.jp/~k-aki/diary/diary201004.xhtml
  ;;gitの文字コード設定
  (modify-coding-system-alist 'process "git" '(utf-8-dos . utf-8-unix))

  ;; vc-gitを無効
  ;; http://stackoverflow.com/questions/5748814/how-does-one-disable-vc-git-in-emacs
  ;(delete 'Git vc-handled-backends)
  )


