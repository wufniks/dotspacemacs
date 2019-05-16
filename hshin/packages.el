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
                    (catch-clause . 0)      ; Guessed value
                    (class-close . 0)       ; Guessed value
                    (defun-block-intro . +) ; Guessed value
                    (defun-close . 0)       ; Guessed value
                    (statement . 0)         ; Guessed value
                    (statement-block-intro . +) ; Guessed value
                    (topmost-intro . 0)         ; Guessed value
                    (topmost-intro-cont . 0) ; Guessed value
                    (inclass . +)           ; Guessed value
                    (inline-close . 0)      ; Guessed value
                    (innamespace . 0)       ; Guessed value
                    (member-init-cont . 0)  ; Guessed value
                    (member-init-intro . +) ; Guessed value
                    (namespace-close . 0)   ; Guessed value
                    (annotation-top-cont . 0)
                    (annotation-var-cont . +)
                    (arglist-close . c-lineup-close-paren)
                    (arglist-cont c-lineup-gcc-asm-reg 0)
                    (arglist-cont-nonempty . c-lineup-arglist)
                    (arglist-intro google-c-lineup-expression-plus-4)
                    (block-open . 0)
                    (brace-entry-open . 0)
                    (brace-list-close . 0)
                    (brace-list-entry . 0)
                    (brace-list-intro . +)
                    (brace-list-open . 0)
                    (c . c-lineup-C-comments)
                    (case-label . +)
                    (catch-clause . 0)
                    (class-open . 0)
                    (comment-intro . c-lineup-comment)
                    (composition-close . 0)
                    (composition-open . 0)
                    (cpp-define-intro c-lineup-cpp-define +)
                    (cpp-macro . -1000)
                    (cpp-macro-cont . +)
                    (defun-close . 0)
                    (defun-open . 0)
                    (do-while-closure . 0)
                    (else-clause . 0)
                    (extern-lang-close . 0)
                    (extern-lang-open . 0)
                    (friend . 0)
                    (func-decl-cont . ++)
                    (incomposition . +)
                    (inexpr-class . +)
                    (inexpr-statement . +)
                    (inextern-lang . +)
                    (inher-cont . c-lineup-multi-inher)
                    (inher-intro . ++)
                    (inlambda . c-lineup-inexpr-block)
                    (inline-open . 0)
                    (inmodule . +)
                    (knr-argdecl . 0)
                    (knr-argdecl-intro . +)
                    (label . /)
                    (lambda-intro-cont . +)
                    (member-init-cont . c-lineup-multi-inher)
                    (module-close . 0)
                    (module-open . 0)
                    (namespace-open . 0)
                    (objc-method-args-cont . c-lineup-ObjC-method-args)
                    (objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
                    (objc-method-intro .
                                       [0])
                    (statement-case-intro . +)
                    (statement-case-open . +)
                    (statement-cont nil nil +)
                    (stream-op . c-lineup-streamop)
                    (string . -1000)
                    (substatement . +)
                    (substatement-label . 2)
                    (substatement-open . 0)
                    (template-args-cont c-lineup-template-args +)))) 

    (defun hshin-c++-mode-hook ()
      (c-set-style "mi-team"))        ; use my-style defined above

    (add-hook 'c++-mode-hook 'hshin-c++-mode-hook)
    (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))))

;;; packages.el ends here
