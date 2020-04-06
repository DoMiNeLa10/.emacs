;; require all packages via straight.el
(mapc
 (lambda (repo-info)
   (let* ((repo-name (car repo-info))
          (package-name (or (cadr repo-info)
                            (intern (cadr (split-string repo-name "/"))))))
     (straight-use-package
      `(,package-name :type git :host github :repo ,repo-name))))
 '(("joaotavora/yasnippet")
   ("hniksic/emacs-htmlize" htmlize)
   ("UwUnyaa/presentation-mode")
   ("UwUnyaa/ox-reveal")
   ("stardiviner/ob-php")
   ("emacs-pe/docker-tramp.el" docker-tramp)
   ("skeeto/emacs-http-server" simple-httpd)
   ("UwUnyaa/ox-sfhp")
   ("ledger/ledger-mode")
   ("mooz/js2-mode")
   ("felipeochoa/rjsx-mode")
   ("ananthakumaran/tide")
   ("emacs-php/php-mode")
   ("rust-lang/rust-mode")
   ("Emacs-D-Mode-Maintainers/Emacs-D-Mode" d-mode)
   ("fxbois/web-mode")
   ("UwUnyaa/web-mode-plus")
   ("UwUnyaa/json-mode")
   ("spotify/dockerfile-mode")
   ("yoshiki/yaml-mode")
   ("jrblevin/markdown-mode")
   ("Fanael/edit-indirect")
   ("haskell/haskell-mode")))