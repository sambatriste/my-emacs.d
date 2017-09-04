;;; -*- coding: utf-8-unix -*-

(require 'dired-x)


;;フォルダを開く時, 新しいバッファを作成しない 
;;http://www.bookshelf.jp/soft/meadow_25.html#SEC280
(defun dired-my-advertised-find-file ()
  "フォルダを開く時, 新しいバッファを作成しない"
  (interactive)
  (if (my-parent-dir?) (dired-my-up-directory)
    (let ((kill-target (current-buffer))
        (check-file (dired-get-filename)))
    (funcall 'dired-find-file)
    (if (file-directory-p check-file)
        (kill-buffer kill-target)))))

(defun dired-my-up-directory (&optional other-window)
  "Run dired on parent directory of current directory.
Find the parent directory either in this buffer or another buffer.
Creates a buffer if necessary."
  (interactive "P")
  
  (let* ((dir (dired-current-directory))
         (up (file-name-directory (directory-file-name dir))))
    (or (dired-goto-file (directory-file-name dir))
        ;; Only try dired-goto-subdir if buffer has more than one dir.
        (and (cdr dired-subdir-alist)
             (dired-goto-subdir up))
        (progn
          (if other-window
              (dired-other-window up)
            (progn
              (kill-buffer (current-buffer))
              (dired up))
            (dired-goto-file dir))))))


(define-key dired-mode-map "\C-m" 'dired-my-advertised-find-file)
(define-key dired-mode-map (kbd "M-p") 'dired-my-up-directory)


;; wdired
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
  

;;http://d.hatena.ne.jp/khiker/20070129/nyumon_gnu_emacs
;; C-x 2で分割したdiredバッファ間でコピー(C)、移動(R)
(setq dired-dwim-target t)

;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)
;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)

(defun my-parent-dir? ()
  (let* ((f (dired-get-filename 'no-dir t)))
    (string= f "..")))

(defun my-x-open (file)
  "open file by a associated program."
  (interactive "FOpen File: ")
  (message "Opening %s..." file)
  (cond ((not window-system)
         (find-file file))
        ((eq system-type 'windows-nt)
         (call-process "cmd.exe" nil 0 nil "/c" "start" ""
                       (convert-standard-filename file)))
        ((eq system-type 'darwin)
         (call-process "open" nil 0 nil file))
        (t
         (call-process "xdg-open" nil 0 nil file)))
  (if (functionp 'recentf-add-file)
      (recentf-add-file file))
  (message "Opening %s...done" file))

(defun dired-open-file ()
  "In dired, open the file named on this line."
  (interactive)
  (if (my-parent-dir?) (dired-my-up-directory)
    (my-x-open (dired-get-filename))))

(define-key dired-mode-map "O" 'dired-open-file)

;;http://futurismo.biz/archives/2989
;; C-c p でパスをコピー
(defun my/get-curernt-path ()
  (if (equal major-mode 'dired-mode)
      default-directory
    (buffer-file-name)))
(defun my/copy-current-path ()
  (interactive)
  (let ((fPath (my/get-curernt-path)))
    (when fPath
      (message "stored path: %s" fPath)
      (kill-new (expand-file-name fPath)))))
(global-set-key (kbd "C-x p") 'my/copy-current-path)

