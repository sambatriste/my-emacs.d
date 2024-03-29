;;; -*- coding: utf-8-unix -*-
(use-package paredit
  :diminish paredit-mode
  :config
  (bind-keys :map paredit-mode-map
             ("C-h" . paredit-backward-delete)))

(use-package eldoc
  :defer t
  :config
  (setq eldoc-idle-delay 0.5
        eldoc-minor-mode-string ""))

(use-package rainbow-delimiters
  :defer t)



(defun my/lisp-mode-defaults ()
  (paredit-mode 1)
  (rainbow-delimiters-mode 1)
  (eldoc-mode 1))

(defun my/lisp-mode-hook ()
  (my/lisp-mode-defaults))
(add-hook 'emacs-lisp-mode-hook 'my/lisp-mode-hook)

;; SLIMEのロード
(use-package slime
  :config
  ;; clispをデフォルトのCommon Lisp処理系に設定
  (setq inferior-lisp-program "clisp"))

(use-package lispxmp
  :config
  (defun my-lispxmp ()
    "evalueate sexp and print as comment."
    (interactive)
    (insert "  ; =>")
    (lispxmp)
    (end-of-line))
  :bind
  (:map emacs-lisp-mode-map
        ("C-c C-j" . my-lispxmp)
        :map lisp-interaction-mode-map
        ("C-c C-j" . my-lispxmp)))


