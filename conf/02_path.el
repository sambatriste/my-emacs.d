;;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;http://qiita.com/catatsuy/items/3dda714f4c60c435bb25
;;EmacsでPATHの設定が引き継がれない問題をエレガントに解決する
(if (unix?)
    (progn
      (defun set-exec-path-from-shell-PATH ()
        "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
        (interactive)
        (let ((path-from-shell (replace-regexp-in-string
                                "[ \t\n]*$" "" (shell-command-to-string
                                                "$SHELL --login -i -c 'echo $PATH'"))))
          (setenv "PATH" path-from-shell)
          (setq exec-path (split-string path-from-shell path-separator))))
      (set-exec-path-from-shell-PATH)))
