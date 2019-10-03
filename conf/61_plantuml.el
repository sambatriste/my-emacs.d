
(use-package plantuml-mode
  :mode
  (("\\.puml\\'" . plantuml-mode))
  
  :config
  (setq plantuml-jar-path (expand-file-name "~/.emacs.d/lib/plantuml.jar"))
  (setq plantuml-output-type "png")
  (setq plantuml-options "-charset UTF-8"))
