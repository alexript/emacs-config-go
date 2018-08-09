(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (misterioso)))
 '(ede-project-directories (quote ("y:/")))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (company company-go flycheck-golangci-lint go-add-tags go-autocomplete go-direx go-eldoc go-guru go-mode go-rename go-scratch go-snippets go-tag gotest multi-compile yasnippet flycheck flycheck-color-mode-line flycheck-cstyle flycheck-rtags ac-rtags ede-compdb eide egg git-commit git-commit-insert-issue git-lens git-link git-timemachine github-clone gitignore-mode sr-speedbar bison-mode cmake-font-lock cmake-ide cmake-mode cmake-project ac-c-headers ac-etags auto-complete auto-complete-c-headers auto-complete-exuberant-ctags)))
 '(speedbar-show-unknown-files nil)
 '(speedbar-update-flag t)
 '(speedbar-use-images nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2d3743" :foreground "#e1e1e0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "outline" :family "InconsolataCyr"))))
 '(cursor ((t (:background "light yellow"))))
 '(custom-button ((t (:background "gray72" :foreground "black" :box (:line-width 2 :style released-button)))))
 '(mode-line-buffer-id ((t (:foreground "peru" :weight bold))))
 '(mode-line-inactive ((t (:background "gray29" :foreground "#eeeeec")))))

(require 'package)
(package-initialize)

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

(require 'cmake-mode)
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)
(require 'rtags) ;; optional, must have rtags installed
(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-cstyle)
     (flycheck-cstyle-setup)
     ;; chain after cppcheck since this is the last checker in the upstream
     ;; configuration
     (flycheck-add-next-checker 'c/c++-cppcheck '(warning . cstyle))))
(cmake-ide-setup)

(require 'auto-complete-config)
(require 'auto-complete-exuberant-ctags)
;;(ac-exuberant-ctags-setup)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)
(setq ac-sources (append ac-sources '(ac-source-ctags)))
(add-to-list 'ac-sources 'ac-source-etags)

(require 'ac-etags)

(eval-after-load "etags"
  '(progn
     (ac-etags-setup)))

(add-hook 'c-mode-common-hook 'ac-etags-ac-setup)

(global-set-key (kbd "M-/") 'hippie-expand)
(setq hippie-expand-try-functions-list '(try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-complete-lisp-symbol-partially try-complete-lisp-symbol))

(require 'sr-speedbar)
(global-set-key (kbd "M-s M-s") 'sr-speedbar-toggle)
(setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")


(require 'company)
(require 'flycheck)
(require 'yasnippet)
(require 'multi-compile)
(require 'go-eldoc)
(require 'company-go)

(add-hook 'before-save-hook 'gofmt-before-save)
(setq-default gofmt-command "goimports")
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook (lambda ()
                            (set (make-local-variable 'company-backends) '(company-go))
                            (company-mode)))
(add-hook 'go-mode-hook 'yas-minor-mode)
(add-hook 'go-mode-hook 'flycheck-mode)
(setq multi-compile-alist '(
    (go-mode . (
("go-build" "go build -v"
   (locate-dominating-file buffer-file-name ".git"))
("go-build-and-run" "go build -v && echo 'build finish' && eval ./${PWD##*/}"
   (multi-compile-locate-file-dir ".git"))))
    ))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; (global-ede-mode t)
