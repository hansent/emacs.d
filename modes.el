;;;; config/enable for various modes

;; highlight current line
(global-hl-line-mode) 


;; clojure
(add-hook 'clojure-mode-hook (lambda () (paredit-mode) (evil-paredit-mode)))
(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)

;; web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))



;; company (complete anything)
(global-company-mode) 

;; helm
(require 'helm-config)
(helm-mode 1)
(setq helm-M-x-fuzzy-match t
      helm-buffers-fuzzy-matching t)

;; projectile
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'projectile-dired)


;; neotree
(require 'neotree)
(setq neo-smart-open t)

;; fiplr
(setq fiplr-root-markers '(".git" ".svn"))
(setq fiplr-ignored-globs '((directories (".git" ".svn" ".repl" "out" "target" "node_modules"))
                            (files ("*.jpg" "*.png" "*.zip" "*~" ".*" "#*"))))

