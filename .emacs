;; .emacs

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(default-directory "~/" t)
 '(display-time-24hr-format t)
 '(frame-title-format "%b" t)
 '(global-font-lock-mode t nil (font-core))
 '(rcirc-default-nick "benluo")
 '(safe-local-variable-values (quote ((TeX-master . t))))
 '(senator-highlight-found t)
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25)
 '(tool-bar-mode nil))

 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "outline" :family "Courier New")))))

(setq default-frame-alist
     (cons
      '(foreground-color  . "gray60") 
      default-frame-alist))
(setq default-frame-alist
     (cons
      '(background-color  . "black") 
      default-frame-alist))
(setq default-frame-alist
     (cons
      '(cursor-color      . "DarkRed")
      default-frame-alist))

;; Set load path
(setq load-path (cons "~/.emacs.d/python-mode.el-6.0.3/" load-path))
(setq load-path (append load-path '("~/.emacs.d/mmm-mode")))
(setq load-path (append load-path '("~/.emacs.d/cedet")))
(setq load-path (append load-path '("~/.emacs.d")))

(setq py-shell-name "C:/Python31/python.exe")

(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py'" . python-mode))


;;; add these lines if you like color-based syntax highlighting
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'euc-cn)
(set-clipboard-coding-system 'euc-cn)
(set-terminal-coding-system 'euc-cn)
(set-buffer-file-coding-system 'euc-cn)
(set-selection-coding-system 'euc-cn)
(modify-coding-system-alist 'process "*" 'euc-cn)
(setq default-process-coding-system 
'(euc-cn . euc-cn))
(setq-default pathname-coding-system 'euc-cn)

;;Add by Manny on 16 Mar 2012 start
;(autoload 'pymacs-apply "pymacs")
;(autoload 'pymacs-call "pymacs")
;(autoload 'pymacs-eval "pymacs" nil t)
;(autoload 'pymacs-exec "pymacs" nil t)
;(autoload 'pymacs-load "pymacs" nil t)

;;(pymacs-load "ropemacs" "rope-")
;;(setq ropemacs-enable-autoimport t)
;;Add by Manny on 16 Mar 2012 end

;;set the match object when cursor at the place
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;(utf-translate-cjk-mode)
(set-buffer-file-coding-system 'utf-8)

;; deny tool bar
(tool-bar-mode -1)

;; deny temple file
(setq-default make-backup-files nil)

;; recent file
(require 'recentf)
(recentf-mode 1)

;; Close Emacs start up dialuege
(setq inhibit-startup-message t)

;; set default major mode to text-mode
(setq default-major-mode 'text-mode)

;; set up user information
(setq user-full-name "Manny Zhong")
(setq user-mail-address " zhong.mingyong@gmail.com")

;; syantax highlight
(global-font-lock-mode t)


;;--
;; Load nxml-mode for files ending in .xml, .xsl, .rng, .xhtml, .html
;;--
(autoload 'nxml-mode "nxml-mode" "xml editing mode" t)
(setq auto-mode-alist
     (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\|html\\|htm\\)\\'" . nxml-mode)
       auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.html\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . genricx))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . nxml-mode))
 
;; complete switch buffer name

;;set type y instead of yes
(fset 'yes-or-no-p 'y-or-n-p)

;;Comment by Manny Zhong on 29 Nov 2012 start
;(defun my-compile ()
;  "Use compile to run python programs"
;  (interactive)
;  (compile (concat "python " (buffer-name))))
;(setq compilation-scroll-output t)
;;Comment by Manny Zhong on 29 Nov 2012 end

(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

(require 'linum)
(global-linum-mode)

;; Function to copy lines 
;; "C-c w" copy one line, "C-u 5 C-c w" copy 5 lines 
(defun copy-lines(&optional arg) 
(interactive "p") 
(save-excursion 
(beginning-of-line) 
(set-mark (point)) 
(if arg 
(next-line (- arg 1))) 
(end-of-line) 
(kill-ring-save (mark) (point)) 
) 
) 
;; set key 
(global-set-key (kbd "C-c w") 'copy-lines) 
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

;; End of .emacs
