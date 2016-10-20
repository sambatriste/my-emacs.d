;;; -*- coding: utf-8-unix -*-


;;; set up exec-path
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;;; global keymap
(use-package bind-key
  :config
  (bind-keys :map global-map
             ("C-h" . delete-backward-char)))

(use-package mykie
  :config
  (setq mykie:use-major-mode-key-override t)
  (mykie:initialize))

;;; happy (((()))) !!!
(use-package paren
  :config
;;  (setq show-paren-style 'parenthesis)
  
  (setq show-paren-style 'expression)
  (set-face-attribute 'show-paren-match-face nil
                      :background "#F0F0FF"
                      :foreground nil
                      :weight 'normal)
  (show-paren-mode 1))

;;; yasnippet
(use-package yasnippet
  :diminish yas-minor-mode
  :init
  (yas-global-mode 1)
  (bind-keys :map yas-minor-mode-map
             ("<tab>" . nil)
             ("TAB" . nil)
             ("C-i" . nil)
             ("C-o" . yas/expand)))


;;; projectile
(use-package projectile
  :init
  (projectile-global-mode))

(use-package subword
  :init
  (global-subword-mode 1))


(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))

;;; answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;;http://www.emacswiki.orug/emacs/AlignCommands
(defun align-repeat (start end regexp)
  "Repeat alignment with respect to 
     the given regular expression."
  (interactive "r\nsAlign regexp: ")
  (align-regexp start end 
                (concat "\\(\\s-*\\)" regexp) 1 1 t))


;;====================================
;;; 折り返し表示ON/OFF
;;====================================
(progn
  (defun toggle-truncate-lines ()
    "折り返し表示をトグル動作します."
    (interactive)
    (if truncate-lines
        (setq truncate-lines nil)
      (setq truncate-lines t))
    (recenter))
  (setq truncate-lines nil)
  ;; 折り返し表示ON/OFF
  (global-set-key (kbd "C-c l") 'toggle-truncate-lines))


(use-package auto-save-buffers-enhanced
  :config
  (setq auto-save-buffers-enhanced-interval 10)
  (auto-save-buffers-enhanced t))


;; auto-revertマイナーモードをdiminishしたいので明示的に設定を記載する。
(with-eval-after-load "autorevert"
  (diminish 'auto-revert-mode))
