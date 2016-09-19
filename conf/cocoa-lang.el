;;; -*- coding: utf-8-unix -*-


;; https://gist.github.com/sky-y/3264252

(require 'ucs-normalize)
(prefer-coding-system 'utf-8-hfs)
(setq file-name-coding-system 'utf-8-hfs)
(setq locale-coding-system 'utf-8-hfs)
(set-terminal-coding-system 'utf-8-hfs)
(set-buffer-file-coding-system 'utf-8-hfs)

(defun ucs-normalize-NFC-buffer ()
  (interactive)
  (ucs-normalize-NFC-region (point-min) (point-max)))
(global-set-key (kbd "C-x RET u") 'ucs-normalize-NFC-buffer)
