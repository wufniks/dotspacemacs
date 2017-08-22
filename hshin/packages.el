;;; packages.el --- hshin layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: 신희제 <HeejaeShin@hshin-MacBook.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `hshin-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `hshin/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `hshin/pre-init-PACKAGE' and/or
;;   `hshin/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst hshin-packages
  '(google-c-style)
  "The list of Lisp packages required by the hshin layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun hshin/init-google-c-style ()
  (use-package google-c-style
    :config
    (add-hook 'c-mode-common-hook 'google-set-c-style)
    (c-add-style "mi-team"
                 '("google"
                   (c-basic-offset . 4)     ; Guessed value
                   (c-offsets-alist
                    (access-label . 0)      ; Guessed value
                    (block-close . 0)       ; Guessed value
                    (class-close . 0)       ; Guessed value
                    (defun-block-intro . +) ; Guessed value
                    (inclass . +)           ; Guessed value
                    (inline-close . 0)      ; Guessed value
                    (innamespace . 0)       ; Guessed value
                    (member-init-intro . +)     ; Guessed value
                    (namespace-close . 0)   ; Guessed value
                    (statement . 0)         ; Guessed value
                    (statement-block-intro . +) ; Guessed value
                    (topmost-intro . +)         ; Guessed value
                    (topmost-intro-cont . 0)))) ; Guessed value

    (defun hshin-c++-mode-hook ()
      (c-set-style "mi-team"))        ; use my-style defined above

    (add-hook 'c++-mode-hook 'hshin-c++-mode-hook)))

;;; packages.el ends here
