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

(defun larger-font ()
  (interactive)
  (set-default-font "Consolas-18"))


;; font
(if (eq system-type 'darwin)
  (setq mac-allow-anti-aliasing t))





(set-face-attribute 'default nil :font "Consolas-16")
(set-frame-font "Consolas-16" nil t)
(setq-default lispy-spacing 3)


;; powerline
(powerline-center-theme)
(nighttime-colors)



