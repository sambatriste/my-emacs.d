;;; -*- coding: utf-8-unix -*-

(require 'org)
(setq org-use-fast-todo-selection t)
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(x)" "CANCEL(c)")
;;         (sequence "APPT(a)" "|" "DONE(d)" "CANCEL(c)")))
(setq org-directory "~/org/")
(setq org-default-notes-file (expand-file-name "main.org" org-directory))
(global-set-key (kbd "C-c a") 'org-agenda)

;; (save-window-excursion (shell-command (format "emacs-test -l test-minimum -l %s %s &" buffer-file-name buffer-file-name)))
(require 'org-install)
(setq org-startup-truncated nil)
(setq org-return-follows-link t)

;;http://d.hatena.ne.jp/rubikitch/20100819/org
(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline nil "Inbox")
         "** TODO %?\n   %i\n   %a\n   %t")
        ;; ("b" "Bug" entry
        ;;  (file+headline nil "Inbox")
        ;;  "** TODO %?   :bug:\n   %i\n   %a\n   %t")
        ("i" "Idea" entry
         (file+headline nil "New Ideas")
         "** %?\n   %i\n   %a\n   %t")))
(global-set-key (kbd "C-c c") 'org-capture)


(setq org-agenda-custom-commands
      '(("o" "Office block "
         ((agenda "+OFFICE")
          (tags-todo "+OFFICE+CATEGORY=\"Tasks\"+LEVEL>=2+Effort=\"\"")
          (tags-todo "+OFFICE+CATEGORY=\"Projects\"+LEVEL>=4+Effort=\"\"")
          ;;(tags-todo "LEVEL>=3+OFFICE+SCHEDULED=\"\"")
          ;;会社のプロジェクトでレベル以上でスケジューリングされていないタスク
          (tags "+OFFICE+CATEGORY=\"Projects\"+TODO<>\"DONE\"+LEVEL>=4+SHEDULED=\"\"")))
        ("!" "Someday" tags "CATEGORY=\"Someday\"")))

;;org-stuck-projects
;;(setq org-enforce-todo-dependencies t)
(setq org-agenda-dim-blocked-tasks t)


;; 見積り時間
(setq org-agenda-time-grid
      '((daily today require-timed)
        "----------------"
        (0900 1000 1100 1200 1300 1400 1500 1600 1700)))


;;http://valvallow.blogspot.jp/2011/02/org-agenda-weekly-view.html
(defadvice org-agenda (around org-agenda-around)
  (let ((system-time-locale "English"))
    ad-do-it))
(defadvice org-agenda-redo (around org-agenda-redo-around)
  (let ((system-time-locale "English"))
    ad-do-it))
(custom-set-variables
 '(org-agenda-format-date "%Y/%m/%d (%a)"))
(custom-set-faces
 '(org-agenda-date ((t :weight bold))))



;; refileするレベルを設定
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 2) (nil :maxlevel . 2))))


;;http://hpcgi1.nifty.com/spen/index.cgi?OrgMode%2fOrganize_Your_Life_In_Plain_Text!%282%29#i19
;; Keep tasks with dates off the global todo lists
(setq org-agenda-todo-ignore-with-date nil)

;; Remove completed deadline tasks from the agenda view
(setq org-agenda-skip-deadline-if-done nil)

;; Remove completed scheduled tasks from the agenda view
(setq org-agenda-skip-scheduled-if-done nil)

;; Remove completed items from search results
(setq org-agenda-skip-timestamp-if-done nil)


(custom-set-variables
 '(org-agenda-format-date "%Y/%m/%d (%a)")
 )
(custom-set-faces
 '(org-agenda-date ((t :weight bold)) t))

;; deadline の表示が早すぎるので
(setq org-deadline-warning-days 7)


;; タイムスタンプの曜日を統一したいので(MacとWinで動作がかわる)
;; "Japanese" 月火水
;; "C" Mon Tue Wed
;; http://d.hatena.ne.jp/tksshj/20110623/1308790232
;; http://d.hatena.ne.jp/kyagi/20090606/1244285675
;;
;; Macだと
;; (set (make-local-variable 'system-time-locale) "ja_JP.UTF-8")
;; (format-time-string "%a" (current-time))
;; で、文字化けする。
;; のでやっぱり"C"にする。

;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (progn
;;               (set (make-local-variable 'system-time-locale) "C")
;;               (load-file "~/.emacs.d/bin/flysphinx.el"))))



(defun my-toggle-org-clock()
  "org-modeの作業時間表示を切り替える"
  (interactive)
  (cond (my-org-clock-flg
         (org-clock-remove-overlays)
         (setq my-org-clock-flg nil))
        (t
         (org-clock-display)
         (setq my-org-clock-flg 1))))
(setq my-org-clock-flg nil)
(define-key org-mode-map (kbd "<M-f10>") 'my-toggle-org-clock)
(define-key org-mode-map (kbd "<M-f11>") 'org-clock-goto)
(define-key org-mode-map (kbd "<M-f12>") 'org-agenda-columns)


;; mobileOrgが振るIDがめっちゃ重複するのでオフにする。
(setq org-mobile-force-id-on-agenda-items nil)



;; http://stackoverflow.com/questions/13363267/how-to-remove-footer-details-in-org-mode-html-export
(setq org-export-html-postamble t)

;; http://stackoverflow.com/questions/9742836/how-do-i-format-the-postamble-in-html-export-with-org-mode
(setq org-export-html-postamble-format
      '(("en" "<div align=\"right\"><p class=\"postamble\">Last Updated %d. </p></div>")))


(setq org-src-fontify-natively t)
;; Change task state to STARTED when clocking in
(setq org-clock-in-switch-to-state "STARTED")
;; クロックを止めてもタスクが終了とは限らないので
;;(setq org-clock-out-switch-to-state "DONE")


;; タスクの依存関係を強制する。
(setq org-enforce-todo-dependencies t)
(setq org-agenda-dim-blocked-tasks 'invisible)
(setq org-enforce-todo-checkbox-dependencies t)

(require 'org-protocol)

;; PROPERTY :OWNER: は子の要素に引き継がれる。
(setq org-use-property-inheritance (quote ("OWNER")))

;; plantumlを使う
(setq org-plantuml-jar-path "~/.emacs.d/lib/plantuml.jar")
(defun org-mode-init ()
  (org-babel-do-load-languages
   'org-babel-load-languages
   (add-to-list 'org-babel-load-languages '(plantuml . t))))
(add-hook 'org-mode-hook 'org-mode-init)
