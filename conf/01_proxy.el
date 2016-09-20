;;; -*- coding: utf-8-unix -*-

(if (win?)
    (setq url-proxy-services
          '(("no_proxy" . "localhost")
            ("http" . "oskproxy.intra.tis.co.jp:8080")
            ("https" . "oskproxy.intra.tis.co.jp:8080"))))


