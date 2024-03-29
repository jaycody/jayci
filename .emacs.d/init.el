;; -*- mode: elisp -*-


;; Open 'daily operations' on startup
(setq initial-buffer-choice "~/Dropbox/_APPS/orgmode/daily-ops.org")

;; Disable the splash screen (to enable it again, replace the t with o)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

;;;; Acitvate AGENDA
(setq org-agenda-files '("~/Dropbox/_APPS/orgmode/done-archive.org"))

 (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; bind keys to invoke agenda mode 
 (global-set-key "\C-cl" 'org-store-link)
 (global-set-key "\C-ca" 'org-agenda)
 (global-set-key "\C-cc" 'org-capture)
 (global-set-key "\C-cb" 'org-iswitchb)
 (global-set-key "\C-ce" 'org-export)

;;;; WORkFLOW
(setq org-todo-keywords
  '((sequence "NOW->" "NEXT" "DECK" "WAIT" "BACK" "|" "DONE")))

(setq org-todo-keyword-faces
  '(("NOW" . (:foreground "red" :weight bold))
    ("NEXT" . (:foreground "orange" :weight bold))
    ("DECK" . (:foreground "grey" :weight bold))
    ("DONE" . (:foreground "blue" :weight bold))
    ("WAIT" . (:foreground "yellow" :background "grey" :slant italic :weight bold))
    ("BACK" . (:foreground "black" :slant italic :weight bold))))

(defun my-org-hide-done ()
  "Hide current task if marked as DONE."
  (when (member org-state org-done-keywords)
    (org-flag-subtree t)))

(add-hook 'org-after-todo-state-change-hook 'my-org-hide-done)

;;;; Hide DONE when I collapse a heading
;(defun my-org-hide-done (&optional pom)
;  "Hide headline if it's marked as DONE."
;  (save-excursion
;    (when pom (goto-char pom))
;    (when (looking-at org-complex-heading-regexp)
;      (when (member (match-string 2) org-done-keywords)
;        (org-flag-subtree t)))))
;(add-hook 'org-cycle-hook #'my-org-hide-done)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(defun my-org-mode-hook ()
;  "Hide DONE tasks."
;  (org-map-entries
;   (lambda ()
;     (when (member (org-get-todo-state) org-done-keywords)
;       (org-flag-subtree t)))
;   t 'file))
;(add-hook 'org-mode-hook 'my-org-mode-hook)


(custom-theme-set-faces 'user
  `(org-level-1 ((t (:height 1.2 :bold t :weight bold)))))

;;(org-level-2 ((t (:bold t :foreground "#006699" :weight bold))))
;;(org-level-3 ((t (:bold t :foreground "#cc3300" :weight bold))))
;;(org-level-4 ((t (:italic t :bold t :foreground "#009933" :slant italic :weight bold))))
;;(org-level-5 ((t (:bold t :foreground "#660066" :weight bold))))
;;(org-level-6 ((t (:bold t :foreground "ForestGreen" :weight bold))))
;;(org-level-7 ((t (nil))))
;;(org-level-8 ((t (:foreground "#990099"))))
;;(org-link ((t (:foreground "Purple" :underline t))))

;;(org-level-1 ((t ,ol1)))
;;(org-level-2 ((t ,ol2)))
;;(org-level-3 ((t ,ol3)))
;;(org-level-4 ((t ,ol4)))
;;(org-level-5 ((t ,ol5)))
;;(org-level-6 ((t ,ol6)))
;;(org-level-7 ((t ,ol7)))
;;(org-level-8 ((t ,ol8)))

;;;; CONTEXTS and TAGS
;; C-c C-q <tag shortcut>
(setq org-tag-alist '(("@portal" . ?p) 
                      ("@jira" . ?j) 
                      ("@ops" . ?o) 
                      ("@misti" . ?m)
                      ("@admin" . ?a) 
                      ("@comms" . ?c)
                      ("@isc" . ?i)))

;;;; LAYOUT
(setq org-startup-indented t)

;; Set the Command key as the M in Meta
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/Dropbox/_APPS/orgmode/daily-ops.org")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
