
;; key bindings
(global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to

(global-set-key [f8] 'neotree-toggle)

; evil mode / evil-leader
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-mode 1)

(evil-leader/set-key
  "e" 'my-find-files
  "f" 'helm-find-files
  "b" 'my-switch-to-buffer
  "k" 'kill-buffer
  ","  'helm-M-x
  "x"  'eval-expression
  ";"  'evil-toggle-comment-visual
  "`"  'neotree-toggle  )


; Overload commenting and shifting so that they don't lose the selection
(define-key evil-visual-state-map (kbd ">") 'evil-shift-right-visual)
(define-key evil-visual-state-map (kbd "<") 'evil-shift-left-visual)
(define-key evil-visual-state-map [tab] 'evil-shift-right-visual)
(define-key evil-visual-state-map [S-tab] 'evil-shift-left-visual)




; super / command key mappings
(evil-define-key 'insert global-map (kbd "s-d") 'eval-last-sexp)
(evil-define-key 'normal global-map (kbd "s-d") 'eval-defun)

(global-set-key (kbd "<s-d>") 'eval-last-sexp)
(global-set-key (kbd "<s-D>") 'eval-defun)

(global-set-key (kbd "<s-right>") 'move-end-of-line)
(global-set-key (kbd "<s-left>") 'move-beginning-of-line)
(global-set-key (kbd "<s-up>") 'scroll-down)
(global-set-key (kbd "<s-down>") 'scroll-up)
(global-set-key (kbd "<s-backspace>") '(lambda () (interactive) (kill-line 0)) )

(global-set-key (kbd "s-+") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)


; helm key mappings
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(define-key helm-map (kbd "<s-return>")  'helm-select-action) ; list actions using C-z
(define-key helm-map (kbd "<s-=>")  'helm-toggle-visible-mark) ; list actions using C-z
(define-key helm-map (kbd "<s-+>")  'helm-toggle-all-marks) ; list actions using C-z
(define-key helm-map (kbd "<s-!>")  'helm-suspend-update-flag) ; list actions using C-z


; neo tree
(add-hook 'neotree-mode-hook
    (lambda ()
        (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
        (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
        (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
        (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))


; make esc quit everything
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)


