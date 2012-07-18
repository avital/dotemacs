(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(add-to-list 'load-path "~/.emacs.d/expand-region/")

(defun region-active-p ()
   "Return t if Transient Mark mode is enabled and the mark is active."
   (and transient-mark-mode mark-active))

(require 'color-theme)
(require 'expand-region)
(global-set-key (kbd "M-=") 'er/expand-region)

(color-theme-initialize)
(color-theme-hober)
(column-number-mode)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(gud-gdb-command-name "gdb --annotate=1")
 '(js2-basic-offset 2)
 '(large-file-warning-threshold nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)
