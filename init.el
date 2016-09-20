(let ((my-emacsd "~/.emacs.d/"))
   (add-to-list 'load-path (expand-file-name  "elisp" my-emacsd))
   (require 'init-loader)
   (init-loader-load (expand-file-name "conf" my-emacsd)))
  
