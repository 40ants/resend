<a id="x-28RESEND-DOCS-2FINDEX-3A-40README-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

# resend - A client library for sending emails via resend.com

<a id="resend-asdf-system-details"></a>

## RESEND ASDF System Details

* Description: A client library for sending emails via resend.com
* Licence: Unlicense
* Author: Alexander Artemenko <svetlyak.40wt@gmail.com>
* Homepage: [https://40ants.com/resend/][7ea8]
* Bug tracker: [https://github.com/40ants/resend/issues][57f5]
* Source control: [GIT][2e82]
* Depends on: [dexador][8347], [log4cl][7f8b], [secret-values][cd18], [serapeum][c41d], [spinneret][8175], [yason][aba2]

[![](https://github-actions.40ants.com/40ants/resend/matrix.svg?only=ci.run-tests)][f103]

![](http://quickdocs.org/badge/resend.svg)

<a id="x-28RESEND-DOCS-2FINDEX-3A-3A-40INSTALLATION-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Installation

You can install this library from Quicklisp, but you want to receive updates quickly, then install it from Ultralisp.org:

```
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload :resend)
```
<a id="x-28RESEND-DOCS-2FINDEX-3A-3A-40USAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Usage

This is a simple client to Resend.com. It allows to send transactional `HTML` emails.

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
<a id="x-28RESEND-DOCS-2FINDEX-3A-3A-40API-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## API

<a id="x-28RESEND-DOCS-2FINDEX-3A-3A-40RESEND-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### RESEND

<a id="x-28-23A-28-286-29-20BASE-CHAR-20-2E-20-22RESEND-22-29-20PACKAGE-29"></a>

#### [package](020a) `resend`

<a id="x-28RESEND-DOCS-2FINDEX-3A-3A-7C-40RESEND-3FMacros-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Macros

<a id="x-28RESEND-3ASEND-20-2840ANTS-DOC-2FLOCATIVES-3AMACRO-29-29"></a>

##### [macro](d828) `resend:send` (from email subject) &body body

Sends `HTML` letter to an email.

Body of this macro should contain a markup for spinneret library.
Also, it can use "htm" macro, to wrap html markup in the inner
lisp constructions such as loops and conditional expressions.

<a id="x-28RESEND-DOCS-2FINDEX-3A-3A-7C-40RESEND-3FVariables-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Variables

<a id="x-28RESEND-3A-2AAPI-KEY-2A-20-28VARIABLE-29-29"></a>

##### [variable](23f4) `resend:*api-key*` nil

This should be a string or a secret-values:secret-value.

<a id="x-28RESEND-3A-2AUSER-AGENT-2A-20-28VARIABLE-29-29"></a>

##### [variable](61f9) `resend:*user-agent*` "CL Resend (https://40ants.com/resend/)"

A value to be used in User-Agent `HTTP` header.


[7ea8]: https://40ants.com/resend/
[2e82]: https://github.com/40ants/resend
[f103]: https://github.com/40ants/resend/actions
[020a]: https://github.com/40ants/resend/blob/58a2e0ad18d5b0286f56b06089e5cc1cd6ab073d/src/core.lisp#L1
[23f4]: https://github.com/40ants/resend/blob/58a2e0ad18d5b0286f56b06089e5cc1cd6ab073d/src/core.lisp#L20
[61f9]: https://github.com/40ants/resend/blob/58a2e0ad18d5b0286f56b06089e5cc1cd6ab073d/src/core.lisp#L23
[d828]: https://github.com/40ants/resend/blob/58a2e0ad18d5b0286f56b06089e5cc1cd6ab073d/src/core.lisp#L52
[57f5]: https://github.com/40ants/resend/issues
[8347]: https://quickdocs.org/dexador
[7f8b]: https://quickdocs.org/log4cl
[cd18]: https://quickdocs.org/secret-values
[c41d]: https://quickdocs.org/serapeum
[8175]: https://quickdocs.org/spinneret
[aba2]: https://quickdocs.org/yason

* * *
###### [generated by [40ANTS-DOC](https://40ants.com/doc/)]
