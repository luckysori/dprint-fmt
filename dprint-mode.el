(define-minor-mode dprint-mode
  "Use dprint to format the current file"
  :lighter " dprint")

(defun dprint-format-file ()
  "Format the current file using dprint"
  (interactive)
  (unless (executable-find "dprint")
    (error "Could not locate dprint executable"))
  (async-shell-command (concat "dprint fmt " buffer-file-name)))

(defcustom dprint-fmt-on-save nil
  "Format files before saving using dprint."
  :type 'boolean
  :safe #'booleanp
  :group 'dprint-mode)

(defun dprint-before-save-method ()
  (when (and
         (bound-and-true-p dprint-mode)
         dprint-fmt-on-save)
    (call-interactively #'dprint-format-file)))

(add-hook 'before-save-hook 'dprint-before-save-method)

(provide 'dprint-mode)
