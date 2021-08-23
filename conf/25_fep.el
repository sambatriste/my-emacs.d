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


;; http://cha.la.coocan.jp/doc/NTEmacs.html を使用するので、いったんコメントアウト
;; https://github.com/chuntaro/NTEmacs64
(when (win?)
  ;; (set-language-environment "UTF-8") ;; UTF-8 でも問題ないので適宜コメントアウトしてください
  (setq default-input-method "W32-IME")
  (setq-default w32-ime-mode-line-state-indicator "[EN]")
  (setq w32-ime-mode-line-state-indicator-list '("[EN]" "[JP]" "[EN]"))
  (w32-ime-initialize)
  ;; 日本語入力時にカーソルの色を変える設定 (色は適宜変えてください)
  (add-hook 'w32-ime-on-hook '(lambda () (set-cursor-color "coral4")))
  (add-hook 'w32-ime-off-hook '(lambda () (set-cursor-color "green")))

  ;; 以下はお好みで設定してください
  ;; 全てバッファ内で日本語入力中に特定のコマンドを実行した際の日本語入力無効化処理です
  ;; もっと良い設定方法がありましたら issue などあげてもらえると助かります

  ;; ミニバッファに移動した際は最初に日本語入力が無効な状態にする
  (add-hook 'minibuffer-setup-hook 'deactivate-input-method)

  ;; isearch に移行した際に日本語入力を無効にする
  (add-hook 'isearch-mode-hook '(lambda ()
                                  (deactivate-input-method)
                                  (setq w32-ime-composition-window (minibuffer-window))))
  (add-hook 'isearch-mode-end-hook '(lambda () (setq w32-ime-composition-window nil)))

  ;; helm 使用中に日本語入力を無効にする
  (advice-add 'helm :around '(lambda (orig-fun &rest args)
                               (let ((select-window-functions nil)
                                     (w32-ime-composition-window (minibuffer-window)))
                                 (deactivate-input-method)
                                 (apply orig-fun args)))))

;; https://qiita.com/TomokiYamashit3/items/915e270b20f9b4e4a1d0#%E6%97%A5%E6%9C%AC%E8%AA%9E%E9%96%A2%E4%BF%82
;;; Macの日本語関係
(when (fboundp 'mac-input-source)
  (defun my-mac-selected-keyboard-input-source-chage-function ()
    (let ((mac-input-source (mac-input-source)))
      (set-cursor-color
       (if (string-match "com.google.inputmethod.Japanese.Roman" mac-input-source)
            "black" "VioletRed3"))))
  (add-hook 'mac-selected-keyboard-input-source-change-hook
            'my-mac-selected-keyboard-input-source-chage-function))

(when (functionp 'mac-auto-ascii-mode)  ; ミニバッファに入力時、自動的に英語モード
  (mac-auto-ascii-mode 1))

