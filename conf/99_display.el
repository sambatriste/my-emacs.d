;;; -*- coding: utf-8-unix -*-

;;スタートアップメッセージを非表示
(setq inhibit-startup-screen t)

;; ツールバー
(tool-bar-mode -1)

;;スクロールバー
(scroll-bar-mode nil)

;;メニューバー
(menu-bar-mode t)

;; 行番号
(global-linum-mode t)
;; 行番号フォーマット
(setq linum-format "%3d")

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
  :config
  (volatile-highlights-mode t))


(use-package hl-line
  :config
  (global-hl-line-mode 1)
  (set-face-background 'hl-line "#fff090"))


;; Gitの変更箇所を表示
(use-package git-gutter-fringe
  :config
  (global-git-gutter-mode))
