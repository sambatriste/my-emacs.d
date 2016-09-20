;;; -*- coding: utf-8-unix -*-

(set-language-environment "UTF-8")


;; https://gist.github.com/sky-y/3264252
(defun ucs-normalize-NFC-buffer ()
  (interactive)
  (ucs-normalize-NFC-region (point-min) (point-max)))
(global-set-key (kbd "C-x RET u") 'ucs-normalize-NFC-buffer)
(if (mac?)
    ;; Mac
    (progn
      (prefer-coding-system 'utf-8-unix)
      (setq file-name-coding-system 'utf-8-unix)
      (setq locale-coding-system 'utf-8-unix)
      (require 'ucs-normalize)
      (prefer-coding-system 'utf-8-unix)
      (setq file-name-coding-system 'utf-8-unix)
      (setq locale-coding-system 'utf-8-unix)
      (set-terminal-coding-system 'utf-8-unix)
      (set-buffer-file-coding-system 'utf-8-unix)))
