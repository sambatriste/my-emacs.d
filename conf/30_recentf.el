;;; recentf
(use-package recentf
  :config
  (setq recentf-max-menu-items 300)
  (setq recentf-max-saved-items 300)
  ;; 除外設定
  (setq recentf-exclude '("/recentf" "COMMIT_EDITMSG" "AppData/Local/Temp/"))
  ;; 30秒に一度自動保存する
  (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode t))
