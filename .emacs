(add-to-list 'load-path "~/.emacs.d/lib")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(elisp-cache-byte-compile-files t)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote buffer) nil (ido))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/")))))

(require 'recentf)
(recentf-mode 1)

(setq-default indent-tabs-mode nil)
(define-key global-map (kbd "RET") 'newline-and-indent)

(when (display-graphic-p)
  (set-frame-size (selected-frame) 105 70)
)

(setq make-backup-files nil)
(column-number-mode 1)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lib/ac-dict")
(ac-config-default)

(require 'wc)
(require 'sql-indent)

(require 'ido)

(when (display-graphic-p)
  (require 'fill-column-indicator)
  (setq-default fill-column 79)
  (setq-default fci-rule-column 80)
  (setq-default fci-handle-truncate-lines nil)
  (add-hook 'after-change-major-mode-hook 'fci-mode)
)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(defun my-go-mode-hook ()
  (auto-complete-mode 1)
  (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'my-go-mode-hook)
(with-eval-after-load 'go-mode
  (require 'go-autocomplete))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)

(server-start)

(global-auto-revert-mode 1)

(setq mac-command-modifier 'meta)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq path "/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/mysql/bin")
(setenv "PATH" path)
(setq exec-path (append exec-path '("/usr/local/bin")))

(setq ring-bell-function 'ignore)
