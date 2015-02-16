; I do not like (or need) a splash screen for a text editor
(setq inhibit-splash-screen t)
; Line numbers are useful
(global-linum-mode 1)

; scroll 1 line
(setq scroll-step 1)
;(setq scroll-conservatively 1)

; Enable syntax highlight
(require 'font-lock)
(setq font-lock-maximum-decoration t)

; Set some colorscheme
(set-background-color "Black")
(set-foreground-color "White")
(set-cursor-color "LightSkyBlue")
(set-mouse-color "LightSkyBlue")

; Disable toolbar
(tool-bar-mode -1)

;; highlight during searching
(setq query-replace-highlight t)

;; highlight incremental search
(setq search-highlight t)

;; highlight matches from searches
(setq isearch-highlight t)
(setq search-highlight t)
(setq-default transient-mark-mode t)

;; format the title-bar to always include the buffer name
(setq frame-title-format "emacs - %b")

; Tabsize
(setq default-tab-width 4)

; Indentation
(setq c-default-style "bsd" c-basic-offset 4)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; php syntax highlight
;;(add-to-list 'load-path  "D:/Kituri/Emacs/plugins")
;;(load-library "php-mode")
;;(add-to-list 'auto-mode-alist '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))
;;(add-to-list 'auto-mode-alist '("\\.module\\'" . php-mode))
;;(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cC-l" 'org-insert-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; indenting like i like (C++ style) :-p
;(setq c-default-style "linux")
;(custom-set-variables
; '(load-home-init-file t t))
;(custom-set-faces)
(custom-set-variables
 '(load-home-init-file t t))
(custom-set-faces)
