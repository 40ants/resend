(uiop:define-package #:resend-docs/changelog
  (:use #:cl)
  (:import-from #:40ants-doc/changelog
                #:defchangelog))
(in-package #:resend-docs/changelog)


(defchangelog (:ignore-words ("SLY"
                              "ASDF"
                              "REPL"
                              "HTML"
                              "HTTP"))
  (0.1.0 2023-09-04
         "* Initial version."))
