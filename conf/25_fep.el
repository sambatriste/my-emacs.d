;;; -*- coding: utf-8-unix -*-

(use-package mozc
  :if (arm?)
  :config
  (setq mozc-candidate-style 'echo-area)
  (set-language-environment "Japanese")
  (setq default-input-method "japanese-mozc")
  ;; mozc henkan muhenkan

    ;; 変換キーでon、無変換キーでoffで切り替え
  (global-set-key
   [henkan]
   (lambda () (interactive)
     (when (null current-input-method) (toggle-input-method))))
  (global-set-key
   [muhenkan]
   (lambda () (interactive)
     (inactivate-input-method)))
  (defadvice mozc-handle-event (around intercept-keys (event))
    "Intercept keys muhenkan and zenkaku-hankaku, before passing keys to mozc-server (which the function mozc-handle-event does), to properly disable mozc-mode."
  (if (member event (list 'zenkaku-hankaku 'muhenkan))
      (progn (mozc-clean-up-session)
             (toggle-input-method))
    (progn ;(message "%s" event) ;debug
      ad-do-it)))
  (ad-activate 'mozc-handle-event))



