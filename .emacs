(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(add-to-list 'load-path "~/.emacs.d/expand-region/")
(add-to-list 'load-path "~/.emacs.d/handlebars/")

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") ("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/")))

(defun region-active-p ()
   "Return t if Transient Mark mode is enabled and the mark is active."
   (and transient-mark-mode mark-active))

(require 'color-theme)
(require 'expand-region)
;; (require 'handlebars-sgml-hacks)
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

(defun pop-mark-set-point (n)
"Pop a mark off the stack, and go to the corresponding point. With prefix arg n, do it n times."
(interactive "p")
(if (>= n 1) (pop-mark-set-point (1- n)) (set-mark-command t)))
(define-key ctl-x-map "p" 'pop-mark-set-point)


(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))


(add-hook 'coffee-mode-hook
          (lambda ()
            (set (make-local-variable 'tab-width) 2)
            (set (make-local-variable 'indent-tabs-mode) t)))
