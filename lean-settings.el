;; Copyright (c) 2014 Microsoft Corporation. All rights reserved.
;; Released under Apache 2.0 license as described in the file LICENSE.
;;
;; Author: Soonho Kong
;;

(defgroup lean nil "Lean mode" :prefix 'lean :group 'languages)

(defvar lean-default-executable-name
  (case system-type
    ('gnu          "lean")
    ('gnu/linux    "lean")
    ('gnu/kfreebsd "lean")
    ('darwin       "lean")
    ('ms-dos       "lean")
    ('windows-nt   "lean.exe")
    ('cygwin       "lean.exe") ;; TODO(soonhok): check this
    )
  "Default executable name of Lean"
  )

(defcustom lean-rootdir nil
  "Full pathname of lean root directory. It should be defined by user."
  :group 'lean
  :type 'string
  )

(defcustom lean-executable-name lean-default-executable-name
  "Name of lean executable"
  :group 'lean
  :type 'string
  )

(defcustom lean-delete-trailing-whitespace nil
  "Set this variable to true to automatically delete trailing
whitespace when a buffer is loaded from a file or when it is
written."
  :group 'lean
  :type 'boolean)

(and lean-delete-trailing-whitespace
     (cond
      ; If white-space-cleanup-mode exists, use it
      (((fboundp whitespace-cleanup-mode)
        (add-hook 'lean-mode-hook 'whitespace-cleanup-mode))
       ; Otherwise
       (t (add-hook 'write-file-functions 'whitespace-cleanup)))))

(defcustom lean-rule-column 100
  "Specify rule-column."
  :group 'lean
  :type '(choice (integer :tag "Columns")
                 (const :tag "Unlimited" nil))
  :type 'int)

(defcustom lean-show-rule-column-method nil
  "If enabled, it highlights column"
  :group 'lean
  :type '(choice (const :tag "Disabled" nil)
                 (const :tag "Vertical Line" vline)
                 ;;(const :tag "Whole Lines" lines)
                 ;;(const :tag "Only Beyond lean-rule-column" lines-tail)
                 ))

(provide 'lean-settings)
