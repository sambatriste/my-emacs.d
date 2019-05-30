;;; -*- coding: utf-8-unix -*-

(require 'package)


(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
 ; (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  
)
(package-initialize)

(unless package-archive-contents (package-refresh-contents))

(when (not (require 'use-package nil t))
  (package-install 'use-package))

;;; enable use-package
(require 'use-package)
(setq use-package-always-ensure t)
;(setq use-package-always-pin "melpa-stable")
(setq use-package-verbose t)

;; diminishが効かなくなったので明示的にuse-packageした(use-packageの依存ライブラリのはずだが...)
(use-package diminish)
