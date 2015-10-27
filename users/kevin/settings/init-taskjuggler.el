;;; init-taskjuggler
;;================================================================
;; Config for taskjuggler
;;================================================================
(require 'ox-taskjuggler)
;;(require 'org-taskjuggler3)
;;(require 'org-taskjuggler)
(require 'taskjuggler-mode)

(setq org-taskjuggler-target-version 3.5)
(setq org-taskjuggler-project-tag "project")
(setq org-taskjuggler-resource-tag "resources")
(setq org-taskjuggler-default-project-duration 365)
(setq org-taskjuggler-default-global-properties "
account cost "费用"
account revenue "收入"
balance cost revenue")



(setq org-taskjuggler-default-reports '("include "reports.tji""))


(defun org-taskjuggler-generate-reports ()
  (interactive)

  (message "Generate Reports...")
  (let* ((process-name "tj3")
         (filename (expand-file-name
                    (concat
                     (file-name-sans-extension
                      (file-name-nondirectory buffer-file-name))
                     ".tjp")))
         (command (concat process-name " " filename)))
    (start-process-shell-command process-name nil command))
  (message "Generate Reports...Done"))

(add-hook 'org-taskjuggler-final-hook 'org-taskjuggler-generate-reports)

(provide 'init-taskjuggler)
;; init-taskjuggler.el end here
