;;; -*- coding: utf-8-unix -*-

(defun nop ()
  (interactive))

(when (arm?)
  ;; タッチパッドに触れてしまうので、以下のコマンドを無効にする。
  (global-set-key [ mouse-1] 'nop)
  (global-set-key [C-mouse-1] 'nop))
