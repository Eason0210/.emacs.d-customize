;;; init-local.el --- Configure default locale -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

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


(provide 'init-local)
;;; init-local.el ends here
