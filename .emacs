;;(autoload 'php-mode "php-mode.el" "Php mode." t)
;;(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))
;;(autoload 'python-mode "python-mode.el" "Python mode." t)
;;(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))
;;(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
;;(setq auto-mode-alist (appemd '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))
;;--------Color Theme---------
(require 'color-theme)
(color-theme-initialize)
(color-theme-matrix)
;;--------Color Theme---------
(require 'org-install)
;; My Function
;;(defun sort ()
;;  (beginning-of-buffer)
;;  (set-mark-command)
;;  (end-of-buffer)
;;  (sort-lines)
;;)

;;-------Dired-x-------
(add-hook 'dired-load-hook
     (lambda ()
       (load "dired-x")
       ;; Set dired-x global variables here.  For example:
       ;; (setq dired-guess-shell-gnutar "gtar")
       (setq dired-x-hands-off-my-keys nil)
	(dired-x-bind-find-file)
	(setq dired-omit-files
	      (concat dired-omit-files "\\|^\\..+$"))
        )) 
(add-hook 'dired-mode-hook
   (lambda ()
        ;; Set dired-x buffer-local variables here.  For example:
        ;; (dired-omit-mode 1)
        ))
(define-key global-map "\C-x\C-j" 'dired-jump)
;;-------Dired-x-------

;;-------Auto Complete-------
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)
;;-------Auto Complete-------

;;-------CC Mode-------
;; Make a non-standard key binding.  We can put this in
;; c-mode-base-map because c-mode-map, c++-mode-map, and so on,
;; inherit from it.
(defun my-c-initialization-hook ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-c-initialization-hook)

;; offset customizations not in my-c-style
;; This will take precedence over any setting of the syntactic symbol
;; made by a style.
(setq c-offsets-alist '((member-init-intro . ++)))

;; Create my personal style.
(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 4)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 4)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t))
  "My C Programming Style")
(c-add-style "PERSONAL" my-c-style)

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; set my personal style for the current buffer
  (c-set-style "PERSONAL")
  ;; other customizations
  (setq tab-width 8
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we like auto-newline, but not hungry-delete
  (c-toggle-auto-newline 1))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;;-------CC Mode-------

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(iswitchb-mode t)
 '(menu-bar-mode nil)
 '(ps-use-face-background t)
 '(safe-local-variable-values (quote ((dired-omit-mode . t))))
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
