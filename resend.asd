#-asdf3.1 (error "resend requires ASDF 3.1 because for lower versions pathname does not work for package-inferred systems.")
(defsystem "resend"
  :description "A client library for sending emails via resend.com"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/resend/"
  :source-control (:git "https://github.com/40ants/resend")
  :bug-tracker "https://github.com/40ants/resend/issues"
  :class :40ants-asdf-system
  :defsystem-depends-on ("40ants-asdf-system")
  :pathname "src"
  :depends-on ("resend/core")
  :in-order-to ((test-op (test-op "resend-tests"))))
