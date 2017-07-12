;;; -*- coding: utf-8-unix -*-

(let* ((tmp-dir (getenv "TMP"))
       (backup-dir (expand-file-name (concat tmp-dir "/emacs-backup/"))))
  (setq backup-directory-alist
        `((".*" . ,backup-dir))))

