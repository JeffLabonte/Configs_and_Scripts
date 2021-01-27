;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

(defvar deps
  '(all-the-icons
    better-defaults
    dockerfile-mode
    blacken
    elpy
    evil
    flycheck
    ido
    neotree
    markdown-mode
    makefile-executor
    material-theme
    plantuml-mode
    py-autopep8
    pyvenv
    yaml-mode
    )
  )

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      deps)

;; Enable IDO
(require 'ido)
(ido-mode t)

;; Enable elpy
(elpy-enable)

(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-backend "jedi")
(setq elpy-rpc-virtualenv-path 'current)

;; Use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;; Enable Neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle) ;; F8 - Open neotree

;; Enable Evil
(require 'evil)
(evil-mode 1)

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(require 'plantuml-mode)
(add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode))

(setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme
(global-linum-mode t)               ;; Enable line numbers globally

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; (setq python-shell-interpreter "/usr/bin/python3")

(setq plantuml-jar-path "~/.bin/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)

;; Move from buffer to buffer
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(global-set-key (kbd "C-x k") 'windmove-up)
(global-set-key (kbd "C-x j") 'windmove-down)
(global-set-key (kbd "C-x h") 'windmove-left)
(global-set-key (kbd "C-x l") 'windmove-right)

;;(global-set-key (kbd "C-c k") 'windmove-right)

(global-set-key (kbd "C-x C-k") 'kill-buffer)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (plantuml-mode python-black evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "g") 'neotree-refresh)
            (define-key evil-normal-state-local-map (kbd "n") 'neotree-next-line)
            (define-key evil-normal-state-local-map (kbd "p") 'neotree-previous-line)
            (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
            (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))
