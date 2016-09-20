
(when (require 'server nil t)
  ;;http://stackoverflow.com/questions/885793/emacs-error-when-calling-server-start
  ;; Suppress error "directory ~/.emacs.d/server is unsafe" on windows.
  (if (win?)
      (defun server-ensure-safe-dir (dir) "Noop" t))
  (global-set-key (kbd "C-x C-c") 'server-edit)
  (defalias 'exit 'save-buffers-kill-emacs)
  (unless (server-running-p)
    (if window-system (server-start))))
