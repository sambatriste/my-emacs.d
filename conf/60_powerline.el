;;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

(use-package powerline
  :config
  (defun my-powerline ()
    (set-face-attribute 'mode-line nil
                        :foreground "white"
                        :background "firebrick4"
                        :box nil)
    (set-face-attribute 'mode-line-inactive nil
                        :foreground "white"
                        :background "gray"
                        :box nil)
    (set-face-attribute 'powerline-active1 nil
                        :foreground "white"
                        :background "DodgerBlue")
    (set-face-attribute 'powerline-active2 nil
                        :foreground "white"
                        :background "LightSeaGreen")
    (powerline-reset)
    (powerline-default-theme))
  (my-powerline))

