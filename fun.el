
        
;; clojure script mode
(defun figwheel-repl ()
  (interactive)
  (run-clojure "lein figwheel"))


; open/find files/buffer
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



; toggle commands / shoft indentation without loosing visual selection
(defun evil-toggle-comment-visual ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)
        (evil-normal-state)
        (evil-visual-restore)))

(defun evil-shift-left-visual ()
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun evil-shift-right-visual ()
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))



;; Make escape quit everything, whenever possible.
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
