;;; config.evil --- Package
;;; Commentary:
;;; Code:
(require 'evil)
(require 'evil-leader)
(require 'evil-numbers)
(require 'evil-surround)
(require 'config.neotree)

(global-evil-surround-mode t)
(global-evil-leader-mode t)
(evil-mode t)

;;; CTRL-^ and CTRL-6 are the same on vim
(define-key evil-normal-state-map (kbd "C-6") 'evil-buffer)
(define-key evil-motion-state-map (kbd "C-6") 'evil-buffer)

(define-key evil-normal-state-map (kbd "C-w q") 'evil-window-delete)
(define-key evil-motion-state-map (kbd "C-w q") 'evil-window-delete)

(define-key evil-insert-state-map (kbd "<tab>") #'company-complete)

(evil-ex-define-cmd "Errors" 'flycheck-list-errors)

(evil-leader/set-key
  "p" #'neotree-toggle
  "o" #'neotree-project-dir
  "f" #'fiplr-find-file
  "b" #'ido-switch-buffer)

(add-hook 'evil-insert-state-entry-hook
          (lambda ()
            (relative-line-numbers-mode -1)
            (linum-mode t)))

(add-hook 'evil-insert-state-exit-hook
          (lambda ()
            (linum-mode -1)
            (relative-line-numbers-mode t)))

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(provide 'config.evil)
;;; config.evil ends here
