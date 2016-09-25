;;; -*- coding: utf-8-unix -*-

;;スタートアップメッセージを非表示
(setq inhibit-startup-screen t)

;; ツールバー
(tool-bar-mode -1)

;;メニューバー
(menu-bar-mode t)

;; visible-bell
(setq visible-bell t)


(cond
 ;; ARMだと動作が重いので、軽量な設定にする。
 ((arm?)
  (set-default 'indicate-empty-lines t)
  (setq-default indicate-buffer-boundaries 'right)
  ;;スクロールバー
  (scroll-bar-mode -1))
 (t
  ;; 行番号
  (global-linum-mode t)
  ;; 行番号フォーマット
  (setq linum-format "%3d")
  ;;スクロールバー
  (scroll-bar-mode t)))



;; 列番号
(column-number-mode t)

;;タイトルにフルパス表示
(setq frame-title-format "%f")

;; タブをスペースで扱う
(setq-default indent-tabs-mode nil)

;; タブ幅
(setq tab-width 4)

;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 3000)

(use-package volatile-highlights
  :diminish volatile-highlights-mode
  :config
  (volatile-highlights-mode t))


(use-package hl-line
  :config
;  (global-hl-line-mode 1)
  (set-face-background 'hl-line "LemonChiffon")
  (defun global-hl-line-timer-function ()
    (global-hl-line-unhighlight-all)
    (let ((global-hl-line-mode t))
      (global-hl-line-highlight)))
  (setq global-hl-line-timer
        (run-with-idle-timer 0.04 t 'global-hl-line-timer-function)))

;; Gitの変更箇所を表示
(use-package git-gutter-fringe
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode))

;; リージョン選択の色
(set-face-attribute 'region nil :background "MediumAquamarine")

(if (and (mac?) (window-system))
    (progn
      (setq initial-frame-alist
            '((width . 170)  ; フレーム幅(文字数)
              (height . 58)  ; フレーム高(文字数)
              (top . 0)      ; フレームの Y 位置(ピクセル数)
              (left . 48)    ; フレームの X 位置(ピクセル数)
              ))))

(if (and (win?) (window-system))
    (setq initial-frame-alist
          '((width . 130)  ; フレーム幅(文字数)
            (height . 69)  ; フレーム高(文字数)
            (top . 0)      ; フレームの Y 位置(ピクセル数)
            (left . 960)   ; フレームの X 位置(ピクセル数)
            )))

