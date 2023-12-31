(uiop:define-package #:resend-docs/index
  (:use #:cl)
  (:import-from #:pythonic-string-reader
                #:pythonic-string-syntax)
  #+quicklisp
  (:import-from #:quicklisp)
  (:import-from #:named-readtables
                #:in-readtable)
  (:import-from #:40ants-doc
                #:defsection
                #:defsection-copy)
  (:import-from #:resend-docs/changelog
                #:@changelog)
  (:import-from #:docs-config
                #:docs-config)
  (:import-from #:40ants-doc/autodoc
                #:defautodoc)
  (:export #:@index
           #:@readme
           #:@changelog))
(in-package #:resend-docs/index)

(in-readtable pythonic-string-syntax)


(defmethod docs-config ((system (eql (asdf:find-system "resend-docs"))))
  ;; 40ANTS-DOC-THEME-40ANTS system will bring
  ;; as dependency a full 40ANTS-DOC but we don't want
  ;; unnecessary dependencies here:
  #+quicklisp
  (ql:quickload "40ants-doc-theme-40ants")
  #-quicklisp
  (asdf:load-system "40ants-doc-theme-40ants")
  
  (list :theme
        (find-symbol "40ANTS-THEME"
                     (find-package "40ANTS-DOC-THEME-40ANTS")))
  )


(defsection @index (:title "resend - A client library for sending emails via resend.com"
                    :ignore-words ("JSON"
                                   "HTTP"
                                   "HTML"
                                   "TODO"
                                   "Unlicense"
                                   "REPL"
                                   "ASDF:PACKAGE-INFERRED-SYSTEM"
                                   "ASDF"
                                   "40A"
                                   "API"
                                   "URL"
                                   "URI"
                                   "RPC"
                                   "GIT"))
  (resend system)
  "
[![](https://github-actions.40ants.com/40ants/resend/matrix.svg?only=ci.run-tests)](https://github.com/40ants/resend/actions)

![Quicklisp](http://quickdocs.org/badge/resend.svg)
"
  (@installation section)
  (@usage section)
  (@api section))


(defsection-copy @readme @index)


(defsection @installation (:title "Installation")
  """
You can install this library from Quicklisp, but you want to receive updates quickly, then install it from Ultralisp.org:

```
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload :resend)
```
""")


(defsection @usage (:title "Usage")
  """
This is a simple client to Resend.com. It allows to send transactional HTML emails.

Here is a quick example:

```
;; First, we need to give it an API key to authenticate itself:
(setf resend:*api-key*
               "re_*************************")

;; Then we can use this macro, to send letter. The macro RESEND:SEND uses Spinneret for rendering it's body
;; to HTML and then sends it to given email.
(let ((name "Bob"))
  (resend:send ("onboarding@resend.dev" "bob@example.com" "Test email message")
    (:h1 "Hello my friend!")
    (:p (format nil "How are you doing, ~A?" name))))
```
""")


(defautodoc @api (:system "resend"))
