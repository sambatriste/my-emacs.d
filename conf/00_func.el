;;; -*- coding: utf-8-unix -*-

;; OSの判定
(defvar os-type nil)
(cond ((string-match "apple-darwin" system-configuration) ;; Mac
       (setq os-type 'mac))
      ((string-match "arm*" system-configuration)        ;; ARM
       (setq os-type 'arm))
      ((string-match "freebsd" system-configuration)      ;; FreeBSD
       (setq os-type 'bsd))
      ((string-match "mingw" system-configuration)        ;; Windows
       (setq os-type 'win))
      ((string-match ".*linux.*" system-configuration)        ;; Linux
       (setq os-type 'linux)))

(defun mac? ()
  (eq os-type 'mac))

(defun linux? ()
  (eq os-type 'linux))

(defun bsd? ()
  (eq os-type 'freebsd))

(defun win? ()
  (eq os-type 'win))

(defun arm? ()
  (eq os-type 'arm))

(defun unix? ()
  (or (mac?) (linux?) (arm?)))

