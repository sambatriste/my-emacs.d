;;; -*- coding: utf-8-unix -*-

(message "try to start server...")
(when (require 'server nil t)
  ;;http://stackoverflow.com/questions/885793/emacs-error-when-calling-server-start
  ;; Suppress error "directory ~/.emacs.d/server is unsafe" on windows.
  (if (win?)
      (defun server-ensure-safe-dir (dir) "Noop" t))
  ;(global-set-key (kbd "C-x C-c") 'server-edit) ;; C-x # がデフォルト
  (defalias 'exit 'save-buffers-kill-emacs)
  ;; try to start server if neccesary.
  (cond ((and window-system (not (eq (server-running-p) t)))
         (server-start)
         ;; check
         (cond ((eq (server-running-p) t)
                (message (concat "server started.")))
               (t
                (error "failed to start server."))))
        (t (message "no need to start server..."))))
