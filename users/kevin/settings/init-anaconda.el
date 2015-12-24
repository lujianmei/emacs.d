;;================================================================
;; Config for anaconda-mode and related packages setting
;;================================================================

(require-package 'anaconda-mode)
(require-package 'ac-anaconda)

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'ac-anaconda-setup)

;;(setq python-shell-virtualenv-path "/usr/local/bin/virtualenv")

(if *is-a-mac*
    (setq python-shell-virtualenv-path "/Users/kevin/.virtualenvs/djangoenv")
  (setq python-shell-virtualenv-path "/usr/bin/virtualenv"))


;;================================================================
;; Config for pyhton envoriment manager
;;================================================================
(require-package 'pyenv-mode)
(require 'pyenv-mode)

(defun projectile-pyenv-mode-set ()
  "Set pyenv version matching project name."
  (let ((project (projectile-project-name)))
    (when (member project (pyenv-mode-versions))
      (pyenv-mode-set project))))

(add-hook 'projectile-switch-project-hook 'projectile-pyenv-mode-set)
