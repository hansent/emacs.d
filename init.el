;; such emacs init

;; general settings
(setq exec-path (append exec-path '("/usr/local/bin")))

(setq inhibit-startup-message t) 

(setq visible-bell nil) 

(setq ring-bell-function 'ignore)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 5))) ;; one line, 5 with shift
(setq mouse-wheel-follow-mouse 't) 
(setq mouse-wheel-progressive-speed 't)
(setq scroll-step 1) 

(setq vc-follow-symlinks nil)

(setq backup-by-copying t
      backup-directory-alist
      '(("." . "~/.saves"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)


; has package list and init
(load-file "~/.emacs.d/packages.el")

; functions used for keybindings and other stuff
(load-file "~/.emacs.d/fun.el")

; config/setup for various modes
(load-file "~/.emacs.d/modes.el")

; font and colors
(load-file "~/.emacs.d/colors.el")

; key bindings
(load-file "~/.emacs.d/key-bindings.el")

