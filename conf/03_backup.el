;;; -*- coding: utf-8-unix -*-

;; バックアップファイル
;; 編集前のファイルのバックアップ
;; foo.txt~

(setq backup-directory-alist '((".*" . "~/.ehist")))

;; 自動保存ファイル
;; 作業中のファイルの自動保存。 Emacs が不正終了した場合に使用
;; #foo.txt#


;; (let* ((tmp-dir (or (getenv "TMPDIR") (getenv "TMP")))
;;        (emacs-auto-save-dir (expand-file-name (concat tmp-dir "/emacs-auto-save/"))))
;;   (setq auto-save-file-name-transforms `((".*" ,emacs-auto-save-dir t))))
;;


;; 自動保存リストファイル
;; .saves-xxx
(setq auto-save-list-file-prefix nil)

;; ロックファイル
;; 同時に修正しないためのロックに使用
;; .#foo.txt
(setq create-lockfiles nil)

