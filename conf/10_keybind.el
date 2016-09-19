;;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;; C-hをバックスペースに割り当て
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)

;; Macの場合
(cond ((mac?)
       ;; UNDOキーバインドをUS配列っぽく
       (global-set-key (kbd "C-=") 'undo) 
       ;; REDOはとなりに
       (global-set-key (kbd "C-~") 'redo)
       ;; バックスラッシュが円マークになる問題回避
       ;; http://cgi.netlaputa.ne.jp/~kose/diary/?200908a&to=200908061#200908061
       (define-key global-map [165] nil)
       (define-key global-map [67109029] nil)
       (define-key global-map [134217893] nil)
       (define-key global-map [201326757] nil)
       (define-key function-key-map [165] [?\\])
       (define-key function-key-map [67109029] [?\C-\\])
       (define-key function-key-map [134217893] [?\M-\\])
       (define-key function-key-map [201326757] [?\C-\M-\\])
       ;; OptionキーとCommandキーを入れ替え
       (setq ns-command-modifier (quote meta))
       (setq ns-alternate-modifier (quote super))
       ))

;; shift 矢印 でウィンドウを移動
(windmove-default-keybindings)
;http://d.hatena.ne.jp/mat_aki/20080421
(global-set-key (quote [kp-8]) (quote windmove-up))
(global-set-key (quote [kp-2]) (quote windmove-down))
(global-set-key (quote [kp-6]) (quote windmove-right))
(global-set-key (quote [kp-4]) (quote windmove-left))


(cond ((win?)
       (global-set-key [M-kanji] 'ignore)
       (global-set-key [non-convert] 'ignore)
       (global-set-key (kbd "C-?") 'redo)
       (global-set-key [convert] 'ignore)
;       (setq pc-select-selection-keys-only t)
;       (pc-selection-mode t)
       ))


(global-set-key (kbd "M-K") 'kill-this-buffer)
;(global-set-key (kbd "C-o") 'other-window)

(global-set-key (kbd "C-;") 'delete-other-windows)

;;; http://qiita.com/kwappa/items/639b40ef0e18170edf43
;;; 矩形編集を開始
(global-set-key (kbd "C-<return>") 'cua-rectangle-mark-mode)

