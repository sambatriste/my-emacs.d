;;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;; http://blog.iwa-ya.net/2010/02/20/091647
;; 以下が Mac 用のフォント設定
(when (memq window-system '(mac ns))
  ;(global-set-key [s-mouse-1] 'browse-url-at-mouse)
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



(if (win?)
    (progn
      (set-frame-font "Migu 1M-11")
      (set-default-font "Migu 1M-11")
;;      (set-frame-font "ARISAKA-等幅-10")
;;      (set-frame-font "Consolas-11")
      )
)

    
(if (arm?)
    (progn
      (set-frame-font "Migu 1M-11")
      (set-default-font "Migu 1M-11")))

