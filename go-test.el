;;; go-test.el --- Run go test from Emacs -*- lexical-binding: t -*-

;;; Commentary
;;
;; go-test defines two separate modes: go-test-mode and
;; go-test-compilation-mode. go-test mode is a minor mode meant to be
;; active in go-mode and dired buffers. go-test-compilation-mode is a
;; major mode for processing the output of go test.
;;
;; - go-test-run-file
;; - go-test-run-dir
;; - go-test-run-project
;;
;; For now go-test-run-test-at-point will not be implemented

;;; Code

(require 'compile)
(require 'project)

(defgroup go-test nil
  "go test Emacs integration"
  :group 'go)

(define-prefix-command 'go-test-mode-keymap)
(define-key go-test-mode-keymap (kbd "v") 'go-test-run-file)
(define-key go-test-mode-keymap (kbd "t") 'go-test-run-test)
(define-key go-test-mode-keymap (kbd "d") 'go-test-run-dir)
(define-key go-test-mode-keymap (kbd "p") 'go-test-run-project)

(define-minor-mode go-test-mode
  "Minor mode for go files to run go test"
  :lighter ""
  :keymap `((,(kbd "C-c ,") . go-test-mode-keymap)))

;; TODO(javier): (define-minor-mode go-test-dired-mode ...)

(define-compilation-mode go-test-compilation-mode "go test"
  "Compilation mode for go test output."
  ;; TODO(javier): Which hooks do we need? compilation-start-hook,
  ;; compilation-filter-hook, compilation-finish-functions?
  )

;;;###autoload
(defun go-test-run-dir ()
  (interactive)
  (compile "go test"))

(defun go-test-run-project ()
  "Run the entire test suite for the project."
  (interactive)
  (let ((default-directory (project-root (project-current t))))
    (compile "go test ./...")))

(provide 'go-test)
;;; go-test.el ends here
