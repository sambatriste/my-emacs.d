;;; -*- coding: utf-8-unix -*-

(require 'ucs-normalize)

;; https://gist.github.com/sky-y/3264252
(defun ucs-normalize-NFC-buffer ()
  (interactive)
  (ucs-normalize-NFC-region (point-min) (point-max)))
(global-set-key (kbd "C-x RET u") 'ucs-normalize-NFC-buffer)

(when (unix?)
  (prefer-coding-system 'utf-8-unix)
  (setq file-name-coding-system 'utf-8-unix)
  (setq locale-coding-system 'utf-8-unix)
  (set-terminal-coding-system 'utf-8-unix)
  (set-buffer-file-coding-system 'utf-8-unix))

(when (win?)
  (prefer-coding-system 'utf-8-unix)
  (set-file-name-coding-system 'cp932)
  (set-keyboard-coding-system 'cp932)
  (set-terminal-coding-system 'cp932)
  (setq default-process-coding-system '(cp932 . cp932))
  ;; パスとファイル名はShift_JIS
  (setq default-file-name-coding-system 'cp932))

