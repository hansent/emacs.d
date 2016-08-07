;; such emacs init
;;

(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                     ("marmalade" . "http://marmalade-repo.org/packages/")
                     ("melpa" . "http://melpa.org/packages/")))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))



; list the packages you want
(setq package-list
      '(better-defaults
        undo-tree
        evil
        paredit
        evil-paredit
        cider
        clojure-mode
        sass-mode
        less-css-mode
        git-gutter
        powerline
        smex
        fiplr
        clj-refactor
        js2-mode
        base16-theme
        web-mode
        yaml-mode
        projectile
        company
        helm
        helm-projectile
        lfe-mode
        flycheck
        erlang
        go-mode
        racket-mode
        neotree))


; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing package-s
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; general
(setq inhibit-startup-message t) ;; no startup message
(global-hl-line-mode) ;; highlight current line
(setq exec-path (append exec-path '("/usr/local/bin")))

(setq backup-by-copying t
      backup-directory-alist
      '(("." . "~/.saves"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; visual bell glitches fixes.
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)


;; evil
(evil-mode 1)

;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)
(add-hook 'neotree-mode-hook
        (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))



;; fiplr
(setq fiplr-root-markers '(".git" ".svn"))
(setq fiplr-ignored-globs '((directories (".git" ".svn" ".repl" "out" "target" "node_modules"))
                            (files ("*.jpg" "*.png" "*.zip" "*~" ".*" "#*"))))

(global-set-key (kbd "C-x C-p") 'fiplr-find-file)

;; powerline
(powerline-center-theme)

;; clojure-mode
(add-hook 'clojure-mode-hook
          (lambda ()
            ;; enable paredit mode
            (paredit-mode)
            (evil-paredit-mode)
            ;; need C-p to show completions
            ))

(defvar om-methods
  (list 'render
        'render-state
        'init-state
        'will-mount
        'did-mount
        'did-update
        'should-update
        'will-receive-props
        'will-update
        'display-name
        'will-unmount
        'ident
        'query
        'query-param)
  "Methods that should receive sexy clojure indents.")

(defun customize-clojure-indents ()
  (dolist (v om-methods)
    (put-clojure-indent v 'defun)))

(add-hook 'clojure-mode-hook #'customize-clojure-indents)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; clj-refactor
(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

;; web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

;; company mode
(global-company-mode)

;; lfe mode
(add-hook 'lfe-mode-hook #'paredit-mode)

;; racket-mode
(setq-default racket-racket-program "/Applications/Racket v6.2.1/bin/racket")
(setq-default racket-raco-program "/Applications/Racket v6.2.1/bin/raco")

;; font
(if (eq system-type 'darwin)
  (setq mac-allow-anti-aliasing t))

(setq preferred-font
      (if (eq system-type 'darwin)
          "Consolas-16"
        "Consolas-12"))


(set-face-attribute 'default nil :font preferred-font)
(set-frame-font preferred-font nil t)
(setq-default lispy-spacing 3)

;; helm
(require 'helm-config)

(helm-mode 1)
(setq helm-M-x-fuzzy-match t
      helm-buffers-fuzzy-matching t)

(projectile-global-mode)

(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'projectile-dired)


(defun my-find-files ()
  (interactive)
  (if (projectile-project-p)
      (helm-projectile)
    (fiplr-find-file)))

(defun my-switch-to-buffer ()
  (interactive)
  (if (projectile-project-p)
      (helm-projectile)
    (helm-for-files)))

(defun daytime-colors ()
  (interactive)
  (load-theme 'base16-bright-light t)
  (set-face-background 'hl-line "#ffffff")
  (set-face-foreground 'highlight nil))

(defun nighttime-colors ()
  (interactive)
  (load-theme 'base16-eighties-dark t)
  (set-face-background 'hl-line "#333333")
  (set-face-foreground 'highlight nil))

(defun current-hour ()
  (nth 2 (decode-time)))

(defun set-time-based-theme ()
  (let ((hour (current-hour)))
    (if (< 7 hour 19) (daytime-colors) (nighttime-colors))))

(defun larger-font ()
  (interactive)
  (set-default-font "Consolas-18"))

(defun enable-ross-mode ()
  (interactive)
  (setq-default indent-tabs-mode t)
  (setq-default tab-width 4))

(defun disable-ross-mode ()
  (interactive)
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 8))

(defun vt220 ()
  (interactive)

  (let ((vt220-font "Glass TTY VT220-20"))
    (set-face-attribute 'default nil :font vt220-font)
    (set-frame-font vt220-font nil t))

  (set-default-font "Glass TTY VT220-20")
  (load-theme 'base16-greenscreen-dark t)
  (set-face-background 'hl-line "#1f1f1f")
  (set-face-foreground 'highlight nil))

(defun vt220-light ()
  (interactive)

  (let ((vt220-font "Glass TTY VT220-20"))
    (set-face-attribute 'default nil :font vt220-font)
    (set-frame-font vt220-font nil t))

  (set-default-font "Glass TTY VT220-20")
  (load-theme 'base16-greenscreen-light t)
  (set-face-background 'hl-line "#aaaaaa")
  (set-face-foreground 'highlight nil))

(defun sharp-mode ()
  (interactive)

  ;;(let ((font "Andale Mono-10:antialias=false"))
  ;;  (set-default-font font)
  ;;  (set-face-attribute 'default nil :font font)
  ;;  (set-frame-font font nil t))

  (load-theme 'base16-monokai-dark t)
  (set-face-background 'hl-line "#333333")
  (set-face-foreground 'highlight nil))

(defun sharp-mode-large ()
  (interactive)
  (sharp-mode)
  (larger-font))


;; scroll one line at a time (less "jumpy" than defaults)
;; scroll faster when holding shift
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5))) ;; one line, 5 with shift
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq mouse-wheel-progressive-speed nil)
(setq scroll-step 1) ;; keyboard scroll one line at a time


(global-set-key (kbd "M-x") 'undefined)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-p") 'my-find-files)
(global-set-key (kbd "C-x b") 'my-switch-to-buffer)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(global-set-key (kbd "<s-right>") 'move-end-of-line)
(global-set-key (kbd "<s-left>") 'move-beginning-of-line)

(global-set-key (kbd "<s-up>") 'scroll-down)
(global-set-key (kbd "<s-down>") 'scroll-up)

(sharp-mode-large)
