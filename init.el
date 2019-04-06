
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(add-to-list 'load-path (expand-file-name  "elisp" user-emacs-directory))
(require 'init-loader)
(init-loader-load (expand-file-name "conf" user-emacs-directory))

(cd "~")
