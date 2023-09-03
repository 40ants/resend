(defsystem "resend-ci"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/resend/"
  :class :package-inferred-system
  :description "Provides CI settings for resend."
  :source-control (:git "https://github.com/40ants/resend")
  :bug-tracker "https://github.com/40ants/resend/issues"
  :pathname "src"
  :depends-on ("40ants-ci"
               "resend-ci/ci"))
