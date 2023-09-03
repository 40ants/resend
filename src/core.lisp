(uiop:define-package #:resend
  (:use #:cl)
  (:import-from #:log4cl)
  (:import-from #:dexador)
  (:import-from #:yason)
  (:import-from #:serapeum
                #:dict)
  (:import-from #:spinneret
                #:with-html-string
                #:with-html)
  (:import-from #:secret-values
                #:ensure-value-revealed)
  (:nicknames #:resend/core)
  (:export #:*api-key*
           #:send
           #:*user-agent*))
(in-package #:resend)


(defvar *api-key* nil
  "This should be a string or a secret-values:secret-value.")

(defvar *user-agent* "CL Resend (https://40ants.com/resend/)"
  "A value to be used in User-Agent HTTP header.")


(defun send-html (from email subject html-body)
  (unless *api-key*
    (error "Unable to send email to ~A because resend:*api-key* is nil" email))
  
  (let* ((data (dict "from" from
                     "to" email
                     "subject" subject
                     "html" html-body))
         (headers (list (cons "User-Agent" *user-agent*)
                        (cons "Content-Type" "application/json")
                        (cons "Authorization"
                              (concatenate 'string
                                           "Bearer "
                                           (ensure-value-revealed *api-key*))))))

    (log:debug "Sending email" subject email)
    
    (dex:post "https://api.resend.com/emails"
              :content (yason:with-output-to-string* ()
                         (yason:encode data))
              :headers headers)
    
    (values)))


(defmacro send ((from email subject) &body body)
  "Sends HTML letter to an email.

   Body of this macro should contain a markup for spinneret library.
   Also, it can use \"htm\" macro, to wrap html markup in the inner
   lisp constructions such as loops and conditional expressions."
  `(macrolet ((htm (&body body)
                `(with-html ,@body)))
     (send-html ,from
                ,email
                ,subject
                (with-html-string ,@body))))
