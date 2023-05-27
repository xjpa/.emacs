; remove default startup, change to scratch buffer
(setq inhibit-startup-message t)

;remove toolbar for more coding space
(tool-bar-mode -1)

; MELPA
(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)
(add-to-list 'package-archives
'("melpa" . "https://melpa.org/packages/"))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

(use-package try
:ensure t)

(use-package which-key
:ensure t
:config
(which-key-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(beacon-color "#f2777a")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(fci-rule-color "#515151")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(package-selected-packages
   (quote
    (weblorg elcord laguna-theme color-theme-sanityinc-tomorrow flycheck rust-mode go-mode counsel ivy tabbar which-key try use-package transpose-frame lsp-mode slime)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil)
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; As-you-type error highlighting
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))


;; make org-mode look pretty
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; so we can also wrap lines in org mode
; see https://www.emacswiki.org/emacs/VisualLineMode
(global-visual-line-mode t)

;; buffer info and autocomplete - i left it for swiper search instead
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)

;; tabbar for buffer management
(use-package tabbar
  :ensure t
  :config
  (tabbar-mode 1))

;; windows management - moving, uses hold shift+arrow key key to move between windows
;;(windmove-default-keybindings)


;; swiper for default search tool and autocompletion
;; not inbuilt from emacs. install "counsel" first from MELPA, not "ivy"  otherwise swiper wont be loaded
(use-package counsel
  :ensure t
  )
(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-load-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

;; other stuff

;; global linum mode for line numbers
(global-linum-mode)
;;(set-default-font "Menlo 16")
; for font
(set-frame-font "17")

;; good theme to use: https://github.com/HenryNewcomer/laguna-theme
; available on MELPA
(load-theme 'laguna t t)
(enable-theme 'laguna)

;;theme: https://github.com/purcell/color-theme-sanityinc-tomorrow
; (require 'color-theme-sanityinc-tomorrow)
; dark mode: M-x color-theme-sanityinc-tomorrow-bright

;; common lisp support
(setq inferior-lisp-program "/usr/local/bin/sbcl")

;;  discord presence https://github.com/Mstrodl/elcord
(require 'elcord)
(elcord-mode)
