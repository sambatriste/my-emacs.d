;;; -*- coding: utf-8-unix -*-


(when (arm?)
  (set-frame-font "Migu 1M-11")
  (set-default-font "Migu 1M-11"))


(when (mac?)
  ;; http://blog.iwa-ya.net/2010/02/20/091647
  (let* ((size 12)
         (jpfont "Hiragino Maru Gothic ProN")
         (asciifont "Menlo")
         (h (* size 10)))
    (set-face-attribute 'default nil :family asciifont :height h)
    (set-fontset-font t 'katakana-jisx0201 jpfont)
    (set-fontset-font t 'japanese-jisx0208 jpfont)
    (set-fontset-font t 'japanese-jisx0212 jpfont)
    (set-fontset-font t 'japanese-jisx0213-1 jpfont)
    (set-fontset-font t 'japanese-jisx0213-2 jpfont)
    (set-fontset-font t '(#x0080 . #x024F) asciifont))
  (setq face-font-rescale-alist
        '(("^-apple-hiragino.*" . 1.2)
          (".*-Hiragino Maru Gothic ProN-.*" . 1.2)
          (".*osaka-bold.*" . 1.2)
          (".*osaka-medium.*" . 1.2)
          (".*courier-bold-.*-mac-roman" . 1.0)
          (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
          (".*monaco-bold-.*-mac-roman" . 0.9)
          ("-cdac$" . 1.3))))

(when (win?)

;; http://d.hatena.ne.jp/eggtoothcroc/20130102/p1
  
;; フォントフォントフォントフ
;; abcdefghijklmnopqrstuvwxyz 
;; ABCDEFGHIJKLMNOPQRSTUVWXYZ
;; `1234567890-=\[];',./
;; ~!@#$%^&*()_+|{}:"<>?
;;
;; 壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五
;; 123456789012345678901234567890123456789012345678901234567890
;; ABCdeＡＢＣｄｅ
;;
;; ┌─────────────────────────────┐
;; │　   　　罫線                │
;; └─────────────────────────────┘
;;

;; | ABC        | DEF        |
;; |------------+------------|
;; | あいうえお | かきくけこ |
;; | 123456     | 789        |
  
  (set-face-attribute 'default nil :family "Consolas" :height 101)
  (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "MeiryoKe_Console"))
  (setq face-font-rescale-alist '(("MeiryoKe_Console" . 1.08)))
  ;; http://misohena.jp/blog/2017-09-26-symbol-font-settings-for-emacs25.html
  (setq use-default-font-for-symbols nil)
;;  (set-frame-font "MyricaM M-11")
  ;;(set-default-font "Migu 1M-11")
  ;;      (set-frame-font "ARISAKA-等幅-10")
  ;;      (set-frame-font "Consolas-11")
  )

;; Windowsでemojiとかをペーストすると動作が重くなる問題の暫定対処
(when (win?)
  (global-font-lock-mode -1)
  (global-font-lock-mode t))

