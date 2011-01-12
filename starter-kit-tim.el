;;; starter-kit-tim.el --- Tim's starter kit adds
;;
;; Part of the Emacs Starter Kit

(ido-mode -1)

;; ------------------------------------------------ settings
;;; Allow extra space at the end of the line
(setq-default fill-column 76)

;;; variables
(setq-default debug-on-error nil)
(setq-default indent-tabs-mode nil)
(setq comment-auto-fill-only-comments t)

;; bindings
(global-set-key "\M-="  'goto-line)

;; ------------------------------------------------ autosave and backup
;; Put autosave files (ie #foo#) in one place, *not* scattered all over the
;; file system! (The make-autosave-file-name function is invoked to determine
;; the filename of an autosave file.) 
(defvar autosave-dir (concat "/tmp/emacs_" (user-login-name) "/"))
(make-directory autosave-dir t)
  
(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))
        
(defun make-auto-save-file-name ()
   (concat autosave-dir
           (if buffer-file-name
               (concat "#" (file-name-nondirectory buffer-file-name) "#")
             (expand-file-name
              (concat "#%" (buffer-name) "#")))))
                             
;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)

(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq bkup-backup-directory-info (list (cons "." backup-dir)))
(setq make-backup-files nil)

(provide 'starter-kit-tim)
;;; starter-kit-tim.el ends here
