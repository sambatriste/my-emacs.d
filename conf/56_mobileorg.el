;;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;http://d.hatena.ne.jp/peccu/20101028/org_presentation
;; MobileOrg へ送る、又は MobileOrg から受け取る為の準備ディレクトリを指定
;; /hoge/org/staging/ というディレクトリにファイルが送られて保存される。
(setq org-mobile-directory (concat org-directory "staging/"))

;; MobileOrg で Capture (新規登録)  した内容が格納される org ファイル
(setq org-mobile-inbox-for-pull (concat org-directory "mobileorg.org"))



;; ;;http://d.hatena.ne.jp/kshimo69/20100511/1273562394
;; ;; MobileOrgとのやりとりに使用するファイルの置き場
;; (setq org-mobile-directory (concat org-directory "stage/"))
;; ;; MobileOrgでキャプチャしたファイルの名前
;; (setq org-mobile-inbox-for-pull (concat org-directory "mobileorg.org"))
;; ;; org-agenda-fileにrefileする設定
;; (setq org-refile-targets '((org-agenda-files :level . 1)))
;; ;; push and pull
;; (defadvice org-mobile-pull (before org-mobile-download activate)
;;   (shell-command "~/bin/download_org.sh"))
;; (defadvice org-mobile-push (after org-mobile-upload activate)
;;   (shell-command "~/bin/upload_org.sh"))

(defcustom org-mobile-checksum-binary (or (executable-find "shasum")
                                          (executable-find "sha1sum")
                                          (executable-find "md5sum")
                                          (executable-find "md5"))
  "Executable used for computing checksums of agenda files."
  :group 'org-mobile
  :type 'string)


(defun my-org-upload-webdav ()
  (interactive)
  (org-mobile-push)
  (let ((curdir (concat (getenv "HOME") "/org/")))
    (cd curdir)
    (start-process           ; async
     "my-org-webdav"         ; name
     "*my_org_webdav*"       ; buffer-name
     "groovy"                    ; program
     "-Dfile.encoding=UTF-8"
     (concat curdir "Push.groovy")         ; arguments
     )))

(defun my-org-upload-webdav-sync ()
  (org-mobile-push)
  (let ((curdir (concat (getenv "HOME") "/org/")))
    (cd curdir)
    (shell-command "groovy Push.groovy" "*my_org_webdav*" "*my_org_webdav*")  ; sync
    )
  )

(defun my-org-download-webdav ()
  (interactive)
  (let ((curdir (concat (getenv "HOME") "/org/")))
    (cd curdir)
    (shell-command "groovy Pull.groovy" "*my_org_webdav*" "*my_org_webdav*")  ; sync
    )
  (org-mobile-pull))
