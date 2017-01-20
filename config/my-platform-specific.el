;; graphic display specific customizations
;; fixes emacs-nox and termux (but will break if run as a daemon on them)
(when (or (display-graphic-p) (daemonp))
  (tool-bar-mode 0)
  (scroll-bar-mode 0))

;; daemon specific code
(when (daemonp)
  (setq frame-title-format "Emacs (server)" ; name of the daemon frame
        ;; fix broken web-mode variables (won't work in emacsclient -t when
        ;; pasting from clipboard)
        web-mode-enable-css-colorization t
        web-mode-enable-auto-indentation t
        web-mode-enable-auto-closing t
        web-mode-enable-auto-pairing t
        web-mode-enable-auto-opening t
        web-mode-enable-auto-quoting t))

;; try configuring fonts
(when (and (member "DejaVu Sans Mono" (font-family-list))
           (display-graphic-p))
    (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-9")))

;; use human readable file sizes in dired if they'll work
(when (or (member system-type '(ms-dos windows-nt))    ; ls in elisp
          (eq 0 (call-process insert-directory-program ; check if ls -h works
                              nil nil nil "-h")))
  (setq dired-listing-switches (concat dired-listing-switches "h")))
