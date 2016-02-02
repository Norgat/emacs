
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
;; Common typing and control configuration

(ido-mode t)
(setq tab-width 2)
(setq indent-tabs-mode t)
(global-hl-line-mode 0)
(show-paren-mode t)
(global-linum-mode t)


;; ===========================================================================
;; ibuffer config

(require 'ibuffer-vc)
(require 'ibuffer-git)

(setq ibuffer-show-empty-filter-groups nil)

;; Modify the default ibuffer-formats
(setq ibuffer-formats
      '((mark modified read-only " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              (git-status 16 16 :left)
              " "
              filename-and-process)))

(defun ibuf/filter-by-read-only ()
  (interactive)
  (ibuffer-filter-by-predicate '(not buffer-read-only)))

;; VC root grouping
(add-hook
 'ibuffer-hook
 (lambda ()
   (ibuffer-vc-set-filter-groups-by-vc-root)
   (ibuffer-do-sort-by-alphabetic)
   (local-set-key (kbd "<f5>") 'ibuf/filter-by-read-only)))


;; ===========================================================================
;; Global key configuration

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "<f12>") 'ibuffer)
;(global-set-key (kbd "<f12>") 'buffer-menu)

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



;; ===========================================================================
;; Autocompletion configuration with company-mode: http://company-mode.github.io/

(global-company-mode t)
(global-set-key (kbd "<f1>") 'company-complete)



;; ===========================================================================
;; JavaScript configuration

;; js2-mode used

(require 'js2-mode)

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)

(require 'paredit)
(define-key js-mode-map "{" 'paredit-open-curly)
(define-key js-mode-map "}" 'paredit-close-curly-and-newline)

