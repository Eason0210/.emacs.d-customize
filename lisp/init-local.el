;;; init-local.el --- Configure default locale -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq *win64* (eq system-type 'windows-nt))

;;Toggle input method
(defun evil-toggle-input-method ()
  "When toggle on input method, switch to evil-insert-state if possible.
When toggle off input method, switch to evil-normal-state if current state is evil-insert-state"
  (interactive)
  (if (not current-input-method)
      (if (not (string= evil-state "insert"))
          (evil-insert-state))
    (if (string= evil-state "insert")
        (evil-normal-state)
      ))
  (toggle-input-method))

(global-set-key (kbd "C-\\") 'evil-toggle-input-method)

(setq comint-scroll-show-maximum-output nil)

(setq-default custom-enabled-themes '(gruvbox-dark-medium))

;;Python-mode custom setting for Windows
(when *win64*
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i"
        python-shell-prompt-regexp "In \\[[0-9]+\\]: "
        python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
        python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"

        python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
        python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

(provide 'init-local)
;;; init-local.el ends here
