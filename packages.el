(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                     ("marmalade" . "http://marmalade-repo.org/packages/")
                     ("melpa" . "http://melpa.org/packages/")))


; list the packages you want
(setq package-list
      '(better-defaults
        undo-tree
        evil
        paredit
        evil-paredit
        ;cider
        clojure-mode
        inf-clojure
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
        neotree
        evil-leader
        ))


; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing package-s
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

