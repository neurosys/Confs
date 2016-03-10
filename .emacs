; I do not like (or need) a splash screen for a text editor
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
; Line numbers are useful
(global-linum-mode 1)

; scroll 1 line
(setq scroll-step 1)
;(setq scroll-conservatively 1)

; Enable syntax highlight
(require 'font-lock)
(setq font-lock-maximum-decoration t)

; Set some colorscheme
;(set-background-color "Black")
;(set-foreground-color "White")
;(set-cursor-color "LightSkyBlue")
;(set-mouse-color "LightSkyBlue")

; Disable toolbar
(tool-bar-mode -1)
;(menu-bar-mode -1)
(scroll-bar-mode -1)
;(w32-send-sys-command #xf030)

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

; Tabs indentation and white space
(setq default-tab-width 4)
(setq tab-width 4)

; Insert spaces instead of tabs
(setq indent-tabs-mode nil)

; Indentation
(c-set-offset 'substatement-open 0)
;(setq c-default-style "bsd" c-basic-offset 4)
(setq c-default-style "stroustrup" c-basic-offset 8)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; php syntax highlight
;(add-to-list 'load-path  "D:/Kituri/Emacs/plugins")
;(load-library "php-mode")
;(add-to-list 'auto-mode-alist '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))
;(add-to-list 'auto-mode-alist '("\\.module\\'" . php-mode))
;(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

;; indenting like i like (C++ style) :-p
;(sqtq c-default-style "linux")

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cC-l" 'org-insert-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cC-o" 'org-open-at-point)
(setq org-log-done t)

(setq org-agenda-files (list "~/org/test.org"
							 "~/org/dizertatie.org"
							 "~/org/la_munca.org"
							 "~/org/acasa.org"
							 ))


;(setenv "MAILHOST" "pop3.itcnetworks")
;(setq rmail-primary-inbox-list '("po:camza")
	  ;rmail-pop-password-required t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wheatgrass)))
 '(indicate-buffer-boundaries (quote right))
 '(indicate-empty-lines t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "outline" :slant normal :weight normal :height 143 :width normal)))))

(setq visible-bell 1)

; Highlight the current line (annoying)
;(global-hl-line-mode 1)

; When reformatting text,  break lines at 80  characters with M-q or  M-1 M-q or
; C-u M-q
(setq-default fill-column 80)

; Move trough paragraphs M-{ and M-}
; Highlight current paragraph M-h

; To switch to other frames C-x 5 o
; To close the current frame C-x 5 0

										; Cycle trough the buffers
(define-key global-map "\M-n" 'next-buffer)
(define-key global-map "\M-p" 'previous-buffer)
