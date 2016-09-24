;;; -*- coding: utf-8-unix -*-

(if (arm?)
    (use-package mozc
      :config
      (setq mozc-candidate-style 'echo-area)
      (set-language-environment "Japanese")
      (setq default-input-method "japanese-mozc")
      (global-set-key "\C-o" 'toggle-input-method)))

