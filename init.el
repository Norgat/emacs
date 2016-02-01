
;; ===========================================================================
;; Initialize package system

(require 'package)
(setq package-archives
      '( ("gnu" . "http://elpa.gnu.org/packages/")
	 ;; ("marmalade" . "http://marmalade-repo.org/packages")
	 ("melpa" . "http://melpa.milkbox.net/packages/")
	 ))
(package-initialize)



;; ===========================================================================
;; Common typing configuration

(ido-mode t)
(setq tab-width 2)
(setq indent-tabs-mode t)
(global-hl-line-mode 0)
(show-paren-mode t)
(global-linum-mode t)



;; ===========================================================================
;; Global key configuration

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
;(global-set-key (kbd "<f12>") 'ibuffer)
(global-set-key (kbd "<f12>") 'buffer-menu)

;; org-mode global keys
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-log-done t)



;; ===========================================================================
;; Desktop save configuration

(require 'desktop)
(desktop-save-mode 1)

(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))

(add-hook 'auto-save-hook 'my-desktop-save)



;; ===========================================================================
;; Snippents configuration

(require 'yasnippet)
(yas-global-mode 1)
