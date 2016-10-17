;;; -*- coding: utf-8-unix -*-


helm-mini-default-sources  ; => (helm-source-buffers-list helm-source-recentf helm-source-buffer-not-found helm-source-ls-git)
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
             ("C-M-r" . helm-recentf)
             ("C-M-g" . helm-ag))
  (bind-keys :map isearch-mode-map
             ;; isearchからhelm-occurを起動
             ("C-o" . helm-occur-from-isearch)))

(use-package helm-ls-git
  :config
  (mykie:set-keys nil
    "C-x C-f"
    :default (call-interactively 'helm-find-files)
    :C-u! helm-ls-git-ls))

(use-package helm-ag
  :config
  (defun helm-projectile-ag ()
    "Projectileとagを連携"
    (interactive)
    (let ((pj-root-dir (ignore-errors (projectile-project-root))))
      (if pj-root-dir
          (helm-ag pj-root-dir)
        (helm-ag))))
  :bind ("C-x C-g" . helm-do-ag-project-root))


(use-package helm-descbinds
  :pin "melpa-stable")
;(use-package helm-migemo)


;; M-x helm-miniの入力元を設定
(setq helm-mini-default-sources
      '(helm-source-buffers-list
        helm-source-files-in-current-dir
        helm-source-buffer-not-found
        helm-source-recentf))
