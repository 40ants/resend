(defsystem "resend-tests"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/resend/"
  :class :package-inferred-system
  :description "Provides tests for resend."
  :source-control (:git "https://github.com/40ants/resend")
  :bug-tracker "https://github.com/40ants/resend/issues"
  :pathname "t"
  :depends-on ("resend-tests/core")
  :perform (test-op (op c)
                    (unless (symbol-call :rove :run c)
                      (error "Tests failed"))))
