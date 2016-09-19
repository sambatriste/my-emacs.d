;;; -*- coding: utf-8-unix -*-

(use-package helm
  :config
  (setq helm-quick-update t
        helm-buffers-fuzzy-matching t
        helm-ff-transformer-show-only-basename nil)
  (bind-keys :map global-map
             ("M-x" . helm-M-x)
             ("C-x C-f" . helm-find-files)
             ("C-x f" . helm-mini)
             ("C-x b" . helm-buffers-list)
             ("M-y" . helm-show-kill-ring)
             ;; helm-occurの起動
             ("C-M-o" . helm-occur)
             ("C-x r" . helm-recentf))

  ;; isearchからhelm-occurを起動
  ;(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)
  )

(use-package helm-ls-git
  :config
  (mykie:set-keys nil
    "C-x C-f"
    :default (call-interactively 'find-file)
    :C-u! helm-ls-git-ls))

(use-package helm-ag
  :bind ("C-x C-g" . helm-do-ag-project-root))


;(use-package helm-migemo)
