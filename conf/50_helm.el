;;; -*- coding: utf-8-unix -*-


(use-package helm
  :config
  (setq helm-quick-update t
        helm-buffers-fuzzy-matching t
        helm-ff-transformer-show-only-basename nil)
  (helm-migemo-mode 1)
  
  (bind-keys :map global-map
             ("M-x" . helm-M-x)
             ("C-x C-f" . helm-find-files)
             ("C-x f" . helm-mini)
             ("C-x b" . helm-buffers-list)
             ("M-y" . helm-show-kill-ring)
             ;; helm-occurの起動
             ;;("C-M-o" . helm-occur)
             ("C-M-o" . helm-swoop)
             ("C-M-r" . helm-recentf)
             ("C-M-g" . helm-ag))
  (bind-keys :map isearch-mode-map
             ;; isearchからhelm-occurを起動
             ("C-o" . helm-occur-from-isearch))
  :diminish helm-migemo-mode)


(use-package helm-swoop
  :config
  ;;; 検索結果をcycleしない、お好みで
  (setq helm-swoop-move-to-line-cycle nil))


(use-package helm-ls-git
  :config
  (mykie:set-keys nil
    "C-x C-f"
    :default (call-interactively 'helm-find-files)
    :C-u! helm-ls-git-ls))

(use-package helm-ag
  :config
  (setq helm-ag-base-command "rg --vimgrep --no-heading")
  (defun helm-projectile-ag ()
    "Projectileとagを連携"
    (interactive)
    (let ((pj-root-dir (ignore-errors (projectile-project-root))))
      (if pj-root-dir
          (helm-ag pj-root-dir)
        (helm-ag))))
  :bind
  ("C-c h" . helm-do-ag-project-root))


;; (use-package helm-descbinds
;;   :pin "melpa-stable")



;; M-x helm-miniの入力元を設定
(setq helm-mini-default-sources
      '(helm-source-buffers-list
        helm-source-files-in-current-dir
        helm-source-buffer-not-found
        helm-source-recentf))
