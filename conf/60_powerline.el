;;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

(use-package powerline
  :config
  (if (mac?)
      ;; これが無いと powerline のみためが悪い
      ;; cf. https://github.com/milkypostman/powerline/issues/54#issuecomment-65078550
      (setq ns-use-srgb-colorspace nil))
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

