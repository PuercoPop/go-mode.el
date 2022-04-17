;;; go-test.el --- Run go test from Emacs -*- lexical-biding: t -*-

;;; Commentary

;; - go-test-run-file
;; - go-test-run-dir
;; - go-test-run-project


;; For now go-test-run-test-at-point will not be implemented

;;; Code

(require 'compile)

(defgroup go-test nil
  ""
  :group 'go)

(define-derived-mode go-test-mode compilation-mode "go test"
  "Compilation mode for go test output.")


(provide 'go-test)
;;; go-test.el ends here
