(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(beacon-blink-delay 0.5)
 '(beacon-blink-when-focused t)
 '(beacon-blink-when-window-scrolls t)
 '(beacon-color 0.2)
 '(blog-minimal-author "alexript")
 '(blog-minimal-blog-email "alexript@outlook.com")
 '(calendar-mark-holidays-flag t)
 '(calendar-view-holidays-initially-flag t)
 '(column-number-mode t)
 '(copyright-at-end-flag t)
 '(copyright-year-ranges t)
 '(custom-enabled-themes (quote (misterioso)))
 '(display-time-mode t)
 '(ede-project-directories (quote ("y:/")))
 '(gh-use-local-git-config t)
 '(global-display-line-numbers-mode t)
 '(go-command "vgo")
 '(newsticker-new-item-functions
   (quote
    (newsticker-download-images newsticker-download-enclosures)))
 '(newsticker-url-list
   (quote
    (("Reddit The Go Programming Language" "https://www.reddit.com/r/golang/.rss?format=xml" nil nil nil))))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (markdown-mode markdown-toc esup auto-compile desktop+ comment-tags color-identifiers-mode blog-minimal beacon bar-cursor auto-indent-mode annotate package+ evil copy-as-format gh gh-md git-attr gitconfig-mode company company-go flycheck-golangci-lint go-add-tags go-autocomplete go-direx go-eldoc go-guru go-mode go-rename go-scratch go-snippets go-tag gotest multi-compile yasnippet flycheck flycheck-color-mode-line flycheck-cstyle flycheck-rtags ac-rtags ede-compdb eide egg git-commit git-commit-insert-issue git-lens git-link git-timemachine github-clone gitignore-mode sr-speedbar bison-mode cmake-font-lock cmake-ide cmake-mode cmake-project ac-c-headers ac-etags auto-complete auto-complete-c-headers auto-complete-exuberant-ctags)))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(speedbar-default-position (quote left-right))
 '(speedbar-hide-button-brackets-flag t)
 '(speedbar-show-unknown-files nil)
 '(speedbar-supported-extension-expressions
   (quote
    (".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ad[abs]" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".go" ".md" "go.mod" ".gitignore")))
 '(speedbar-update-flag t)
 '(speedbar-use-images nil)
 '(tool-bar-mode nil)
 '(tooltip-reuse-hidden-frame t)
 '(window-divider-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2d3743" :foreground "#e1e1e0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "outline" :family "InconsolataCyr"))))
 '(cursor ((t (:background "light yellow"))))
 '(custom-button ((t (:background "gray72" :foreground "black" :box (:line-width 2 :style released-button)))))
 '(line-number ((t (:inherit (shadow default) :background "gray22" :foreground "light gray" :height 0.8))))
 '(line-number-current-line ((t (:inherit line-number :background "gray33"))))
 '(mode-line ((t (:background "#212931" :foreground "#eeeeec" :box (:line-width 1 :color "gray50" :style released-button) :height 0.8))))
 '(mode-line-buffer-id ((t (:foreground "peru" :weight bold))))
 '(mode-line-inactive ((t (:background "gray29" :foreground "#eeeeec" :box (:line-width 1 :color "gray23" :style pressed-button) :height 0.8))))
 '(newsticker-treeview-face ((t (:foreground "white" :height 0.8))))
 '(newsticker-treeview-new-face ((t (:inherit newsticker-treeview-face :foreground "SeaGreen1" :weight bold))))
 '(popup-tip-face ((t (:background "khaki1" :foreground "black" :height 100 :family "Hack"))))
 '(tool-bar ((t (:background "SystemWindowFrame" :foreground "systembuttontext" :box (:line-width 1 :style released-button)))))
 '(tooltip ((t (:inherit variable-pitch :background "systeminfowindow" :foreground "systeminfotext" :height 100 :family "Hack"))))
 '(window-divider ((t (:foreground "DarkGoldenrod1")))))

(require 'package)
(setq load-prefer-newer t)
(package-initialize)
;;(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key [?\C-x ?\C-b] 'ibuffer)
(setq display-time-24hr-format t)
(require 'timezone)
(set-time-zone-rule nil)
;; (set-time-zone-rule "GMT-4")
;; (set-time-zone-rule "MSK-3MSD;M3.5.0/02:00,M9.5.0/03:00")


(load-library "time")
(setq display-time-24hr-format t
      ;;      display-time-mail-file "/var/spool/mail/alex"
      display-time-form-list (list 'time 'load 'mail)
      display-time-day-and-date t)
(display-time)

;; newline and indent
(define-key global-map (kbd "RET") 'newline-and-indent)

(line-number-mode 1)
(column-number-mode 1)
(setq scroll-step 1)
(setq truncate-lines t)
(setq font-lock-maximum-decoration t)

;;(require 'cmake-mode)
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)
;;(require 'rtags) ;; optional, must have rtags installed
(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-cstyle)
     (flycheck-cstyle-setup)
     ;; chain after cppcheck since this is the last checker in the upstream
     ;; configuration
     (flycheck-add-next-checker 'c/c++-cppcheck '(warning . cstyle))))
(cmake-ide-setup)

(require 'auto-complete-config)
;;(require 'auto-complete-exuberant-ctags)
;;(ac-exuberant-ctags-setup)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)
(setq ac-sources (append ac-sources '(ac-source-ctags)))
(add-to-list 'ac-sources 'ac-source-etags)

;;(require 'ac-etags)

(eval-after-load "etags"
  '(progn
     (ac-etags-setup)))

(add-hook 'c-mode-common-hook 'ac-etags-ac-setup)

(global-set-key (kbd "M-/") 'hippie-expand)
(setq hippie-expand-try-functions-list '(try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-complete-lisp-symbol-partially try-complete-lisp-symbol))

;;(require 'sr-speedbar)
(global-set-key (kbd "M-s M-s") 'sr-speedbar-toggle)
(setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")


;;(require 'annotate)

(require 'company)
;;(require 'flycheck)
;;(require 'yasnippet)
;;(require 'multi-compile)
;;(require 'go-eldoc)
;;(require 'company-go)

(add-hook 'before-save-hook 'gofmt-before-save)
(setq-default gofmt-command "goimports")
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook (lambda ()
                            (set (make-local-variable 'company-backends) '(company-go))
                            (company-mode)))
(add-hook 'go-mode-hook 'yas-minor-mode)
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook 'annotate-mode)
(setq multi-compile-alist '(
    (go-mode . (
("go-build" "vgo build -v"
   (locate-dominating-file buffer-file-name ".git"))
("go-build-and-run" "vgo build -v && echo 'build finish' && eval ./${PWD##*/}"
   (multi-compile-locate-file-dir ".git"))))
    ))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; (global-ede-mode t)

(setq auto-indent-on-visit-file t) ;; If you want auto-indent on for files
;;(require 'auto-indent-mode)
(auto-indent-global-mode)


(global-set-key (kbd "M-s r") 'newsticker-treeview)

;;(require 'bar-cursor)
(bar-cursor-mode 1)

(beacon-mode 1)

;;(require 'blog-minimal)

(add-hook 'after-init-hook 'global-color-identifiers-mode)

(require 'comment-tags)
(autoload 'comment-tags-mode "comment-tags-mode")
(setq comment-tags-keymap-prefix (kbd "C-c t"))
(with-eval-after-load "comment-tags"
  (setq comment-tags-keyword-faces
        `(("TODO" . ,(list :weight 'bold :foreground "#28ABE3"))
          ("FIXME" . ,(list :weight 'bold :foreground "#DB3340"))
          ("BUG" . ,(list :weight 'bold :foreground "#DB3340"))
          ("HACK" . ,(list :weight 'bold :foreground "#E8B71A"))
          ("KLUDGE" . ,(list :weight 'bold :foreground "#E8B71A"))
          ("XXX" . ,(list :weight 'bold :foreground "#F7EAC8"))
          ("INFO" . ,(list :weight 'bold :foreground "#F7EAC8"))
          ("DONE" . ,(list :weight 'bold :foreground "#1FDA9A"))))
  (setq comment-tags-comment-start-only t
        comment-tags-require-colon t
        comment-tags-case-sensitive t
        comment-tags-show-faces t
        comment-tags-lighter nil))
(add-hook 'prog-mode-hook 'comment-tags-mode)



(setq default-license  "mit")
(setq copyright-holder  "Alexander Malyshev")
(setq copyright-holder-mail "alexript@outlook.com")
(load-library "~/.emacs.d/xlicense.el")


;; keep my personal settings not in the .emacs file
;; http://www.mygooglest.com/fni/dot-emacs.html
;; load it if it exists
(let ((personal-settings "~/personal.el"))
 (when (file-exists-p personal-settings)
   (load-file personal-settings))
)
