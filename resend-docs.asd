(defsystem "resend-docs"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/resend/"
  :class :package-inferred-system
  :description "Provides documentation for resend."
  :source-control (:git "https://github.com/40ants/resend")
  :bug-tracker "https://github.com/40ants/resend/issues"
  :pathname "docs"
  :depends-on ("resend"
               "resend-docs/index"))
