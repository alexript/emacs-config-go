;;; package+-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "package+" "package+.el" (0 0 0 0))
;;; Generated autoloads from package+.el

(autoload 'package-manifest "package+" "\
Ensures MANIFEST is installed and uninstalls other packages.
MANIFEST declares a list of packages that should be installed on
this system, installing any missing packages and removing any
installed packages that are not in the manifest. After
installation and cleanup, record the manifest in
‘package-selected-packages’ so Emacs can track packages versus
their dependencies.

This makes it easy to keep a list of packages under version
control and replicated across all your environments, without
having to have all the packages themselves under version
control.

If automatic package cleanup is not desired, you can disable this
functionality by setting package-disable-cleanup to t.

If updating ‘package-selected-packages’ is not desired, you can
disable this functionality by setting package-disable-record to
t.

\(fn &rest MANIFEST)" nil nil)

(autoload 'package-view-manifest "package+" "\
Pop up a buffer listing out all installed packages with their dependencies.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "package+" '("package")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; package+-autoloads.el ends here
