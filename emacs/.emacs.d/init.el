;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t )				       ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t)         ; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore)	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8)	; use utf-8 by default
(setq coding-system-for-write 'utf-8)
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq default-fill-column 110)		; toggle wrapping text at the 80th character
(setq initial-scratch-message "Welcome to Emacs") ; print a default message in the empty scratch buffer opened at startup
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1
      scroll-conservatively 10000) ;; keyboard scroll one line at a time

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(blink-cursor-mode 0)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(global-linum-mode 1)
(global-hl-line-mode 0)

(setq-default tab-width 4)
(setq-default truncate-lines 0)
(setq-default help-window-select t)

(defun zoom-frame-in ()
 "Zoom in the current frame."
 (interactive)
 (set-face-attribute 'default (selected-frame)
   :height (+ 10 (face-attribute 'default :height))))

(defun zoom-frame-out ()
 "Zoom out the current frame."
 (interactive)
 (set-face-attribute 'default (selected-frame)
   :height (- (face-attribute 'default :height) 10)))

(setq-default whitespace-style '(face spaces tabs tab-mark trailing))
(global-whitespace-mode)

(cond
   ((string-equal system-type "darwin")
	  (progn
		  (setenv "PATH" (concat (getenv "PATH")
								 ":/usr/local/bin:/usr/sbin:"
								 "/usr/bin:/sbin:/Users/pmeredit/Go/bin:"
								 "/Users/pmeredit/.cargo/bin:"
								 "/usr/local/texlive/2019/bin/x86_64-darwin/"
								 ))
          (setenv "GOPATH" "/Users/pmeredit/Go")
	      (setenv "PKG_CONFIG_PATH" (concat (getenv "PKG_CONFIG_PATH") "/usr/local/Cellar/openssl/1.0.2n/lib/pkgconfig"))
		  (setq exec-path (append exec-path '(
											  "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin"
											  "/Users/pmeredit/Go/bin" "/Users/pmeredit/.cargo/bin"
											  "/usr/local/texlive/2019/bin/x86_64-darwin/"
											  )))

		  (setq mac-command-modifier 'control)
		  (defun zoom-frame-monitor ()
			 "Zoom the current frame to an appropriate size for my thinkvision monitor."
 			 (interactive)
 			 (set-face-attribute 'default (selected-frame) :height 230))

		  (defun zoom-frame-laptop ()
 			 "Zoom the current frame to an appropriate size for my laptop screen."
 			 (interactive)
 			 (set-face-attribute 'default (selected-frame) :height 210))
		  )
	  )
   ((string-equal system-type "gnu/linux")
	  (progn
		  (setenv "PATH" (concat (getenv "PATH")
								 ":/usr/local/bin:/usr/sbin:"
								 "/usr/bin:/sbin:/home/pmeredit/Go/bin:"
								 "/home/pmeredit/.cargo/bin"
								 ))
	      (setenv "GOPATH" "/home/pmeredit/Go")
		  (setq exec-path (append exec-path '(
											  "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin"
											  "/home/pmeredit/Go/bin" "/home/pmeredit/.cargo/bin"
											  )))

		  (defun zoom-frame-monitor ()
			 "Zoom the current frame to an appropriate size for my thinkvision monitor."
 			 (interactive)
 			 (set-face-attribute 'default (selected-frame) :height 140))

		  (defun zoom-frame-laptop ()
 			 "Zoom the current frame to an appropriate size for my laptop screen."
 			 (interactive)
 			 (set-face-attribute 'default (selected-frame) :height 240))
		)
	)
)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'umber t)

(require 'use-package)

(use-package counsel
  :ensure t)

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-initial-inputs-alist nil)
  (define-key ivy-minibuffer-map (kbd "C-<return>") 'ivy-immediate-done))

(use-package general
  :ensure t
  :config
  (general-define-key

   :states '(normal visual emacs)
   :prefix "SPC"

   ;; file
   "f" '(:ignore t :which-key "file")
   "fe" '(:ignore t :which-key "emacs")
   "ff" 'find-file
   "fee" (lambda () "edit" (interactive) (find-file "~/.emacs.d/init.el"))
   "feo" (lambda () "edit" (interactive) (find-file "~/org/lisp/org.el"))
   "fer" (lambda () "reload" (interactive) (load-file user-init-file))

   ;; buffer
   "b" '(:ignore t :which-key "file")
   "bb" 'counsel-ibuffer
   "bd" 'evil-delete-buffer

   ;; jumping
   "j" '(:ignore t :which-key "xref")
   "jj" 'xref-find-definitions
   "jd" 'xref-find-definitions-other-window
   "ju" 'xref-find-references

     ;; git
   "g" '(:ignore t :which-key "git")
   "gs" 'magit-status
   "gf" 'magit-file-popup
   "gm" 'magit-dispatch-popup
   "gb" 'magit-blame
   "gg" 'hydra-gitgutter/body
   "gt" 'git-timemachine
   "gl" 'git-link

   ;; errors
   "e" '(:ignore t :which-key "errors")
   "en" 'next-error
   "ep" 'previous-error

   ;; lisp
   "l" '(:ignore t :which-key "lisp")
   "le" 'eval-last-sexp
   "lp" 'list-packages

   ;; org
   "o" '(:ignore t :which-key "org")
   "oa" 'org-agenda
   "oc" 'org-capture
   "ol" 'org-store-link
   "or" 'org-refile
   "oA" 'org-archive
   "of" 'rpc/open-org-file
   "oh" 'rpc/org-narrow-to-headline
   "os" 'org-save-all-org-buffers

   ;; neotree
   "n" '(:ignore t :which-key "neotree")
   "ns" 'neotree-show
   "nh" 'neotree-hide

   ;; window
   "w" '(:ignore t :which-key "window")
   "wd" 'evil-window-delete
   "wl" 'evil-window-right
   "w <right>" 'evil-window-right
   "wk" 'evil-window-up
   "w <up>" 'evil-window-up
   "wj" 'evil-window-down
   "w <down>" 'evil-window-down
   "wh" 'evil-window-left
   "w <left>" 'evil-window-left
   "w\\" 'evil-window-vsplit
   "w=" 'evil-window-split
   "ww" 'other-frame

   ;; dired
   "d" '(:ignore t :which-key "dired")
   "dd" 'dired-jump-other-window

   ;; projectile
   "p" '(:ignore t :which-key "projectile")
   "pp" 'counsel-projectile-switch-project
   "pf" 'counsel-projectile-find-file
   "pd" 'projectile-dired-other-window
   "pD" 'counsel-projectile-find-dir
   "ps" 'counsel-projectile-rg
   "pb" 'counsel-projectile-switch-to-buffer
   "pu" 'projectile-discover-projects-in-search-path

   ;; ivy
   "i" '(:ignore t :which-key "ivy")
   "ir" 'ivy-resume

   ;; zoom
   "z" '(:ignore t :which-key "zoom")
   "zm" (lambda () "monitor" (interactive) (zoom-frame-monitor))
   "zl" (lambda () "laptop" (interactive) (zoom-frame-laptop))
   "zz" 'hydra-zoom/body

   ;; compile
   "c" '(:ignore t :which-key "compile")
   "cb" 'rpc/compile/build
   "cc" 'rpc/compile/check
   "ct" 'rpc/compile/unit-test
   "cC" 'compile
   "ck" 'rpc/compile-quit-windows

   ;; applications
   "a" '(:ignore t :which-key "applications")
   "am" 'rpc/mu4e/open

   ;; misc
   "x" 'counsel-M-x
   ))

(use-package avy
  :ensure t
  :commands (avy-goto-word-1))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (evil-set-initial-state 'special-mode 'emacs)

  (define-key evil-visual-state-map (kbd "v") 'exchange-point-and-mark)

  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (add-hook 'with-editor-mode-hook 'evil-insert-state)

  (define-key evil-visual-state-map (kbd ">") 'rpc/evil-shift-right-visual)
  (define-key evil-visual-state-map (kbd "<") 'rpc/evil-shift-left-visual)

  (define-key evil-emacs-state-map (kbd "/") 'evil-search-forward)
  (define-key evil-emacs-state-map (kbd "?") 'evil-search-backward)
  (define-key evil-normal-state-map (kbd "/") 'evil-search-forward)
  (define-key evil-normal-state-map (kbd "?") 'evil-search-backward)

  (define-key evil-emacs-state-map (kbd "n") 'evil-search-next)
  (define-key evil-emacs-state-map (kbd "N") 'evil-search-previous)

  (defun rpc/evil-shift-right-visual ()
	(interactive)
	(evil-shift-right (region-beginning) (region-end))
	(evil-normal-state)
	(evil-visual-restore))

  (defun rpc/evil-shift-left-visual ()
	(interactive)
	(evil-shift-left (region-beginning) (region-end))
	(evil-normal-state)
	(evil-visual-restore))

  (use-package evil-god-state
	:ensure t
	:config
	(evil-define-key 'normal global-map "," 'evil-execute-in-god-state)
	(evil-define-key 'god global-map [escape] 'evil-god-state-bail))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1)))

(use-package crux
  :ensure t)

(use-package expand-region
  :ensure t)

(use-package git-link
  :ensure t)

(use-package git-timemachine
  :ensure t)

(use-package magit
  :ensure t
  :config

  (use-package evil-magit
    :ensure t
	:config
	;(define-key git-rebase-mode-map (kbd "J") 'git-rebase-move-line-down)
	;(define-key git-rebase-mode-map (kbd "K") 'git-rebase-move-line-up)
	)

  ;(use-package forge
  ;	:ensure t)
  )

(use-package org
  :ensure t)

(use-package eyebrowse
  :ensure t
  :init
  (setq eyebrowse-keymap-prefix (kbd "C-c C-S-w"))
  :config
  (setq-default eyebrowse-new-workspace t)
  (setq-default eyebrowse-wrap-around t)
  (eyebrowse-mode t))

(use-package go-mode
  :ensure t)

(defun rpc/compile-quit-windows ()
  (interactive)
  (rpc/kill-window-by-buffer-name "*compilation*")
  (rpc/kill-window-by-buffer-name "*compile/build*")
  (rpc/kill-window-by-buffer-name "*compile/check*")
  (rpc/kill-window-by-buffer-name "*compile/unit-test*"))

(defun rpc/kill-window-by-buffer-name (bufname &optional killbuf)
  (let ((window (get-buffer-window bufname)))
	(when window (quit-window killbuf window))))

(defvar rpc/compile/build-command nil)
(defun rpc/compile/build ()
  (interactive)
  (let ((compilation-buffer-name-function (lambda (mode) "*compile/build*")))
    (if rpc/compile/build-command
	    (compile rpc/compile/build-command)
	  (call-interactively 'compile))))

(defvar rpc/compile/check-command nil)
(defun rpc/compile/check ()
  (interactive)
  (let ((compilation-buffer-name-function (lambda (mode) "*compile/check*")))
    (if rpc/compile/check-command
	    (compile rpc/compile/check-command)
	  (call-interactively 'compile))))

(defvar rpc/compile/unit-test-command nil)
(defun rpc/compile/unit-test ()
  (interactive)
  (let ((compilation-buffer-name-function (lambda (mode) "*compile/unit-test*")))
    (if rpc/compile/unit-test-command
	    (compile rpc/compile/unit-test-command)
	  (call-interactively 'compile))))

(defun remove-nth-element (list nth)
  "Return a copy of LIST without its NTH element."
  (if (zerop nth) (cdr list)
    (let ((last (nthcdr (1- nth) list)))
      (setcdr last (cddr last))
      list)))

(use-package projectile
  :ensure t
  :config

  (setq projectile-project-search-path '("~/git/"))

  (use-package counsel-projectile
    :ensure t
    :config
    (counsel-projectile-mode 1)))

(use-package git-gutter-fringe
  :ensure t
  :config
  (global-git-gutter-mode 1)
  (setq-default fringes-outside-margins t)
  (fringe-helper-define 'git-gutter-fr:added '(center repeated)
    "..XXX...")
  (fringe-helper-define 'git-gutter-fr:modified '(center repeated)
    "..XXX...")
  (fringe-helper-define 'git-gutter-fr:deleted 'bottom
    "X......."
    "XX......"
    "XXX....."
    "XXXX...."))

(use-package company
  :ensure t
  :config
  (global-company-mode 1)
  (setq-default company-echo-delay 0)
  (setq-default company-idle-delay 0.1)
  (setq-default company-auto-complete 'company-explicit-action-p)
  (setq-default company-minimum-prefix-length 2)
  (setq-default company-dabbrev-downcase nil)
  (define-key company-active-map (kbd "<tab>") 'company-select-next-if-tooltip-visible-or-complete-selection)
  (define-key company-active-map (kbd "S-<tab>") 'company-select-previous-or-abort)
  )

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :hook (prog-mode . flycheck-mode)
  :config
  (setq flycheck-indication-mode 'right-fringe)
  (fringe-helper-define 'flycheck-fringe-bitmap-double-arrow 'center
    "...XX..."
    "..XXX..."
    ".XXXX..."
    "XXXXX..."
    ".XXXX..."
    "..XXX..."
    "...XX..."))

(use-package hydra
  :ensure t
  :config

  (defhydra hydra-gitgutter ()
    "gitgutter"
    ("j" git-gutter:next-hunk)
    ("k" git-gutter:previous-hunk)
    ("s" git-gutter:stage-hunk)
    ("u" git-gutter:revert-hunk)
    ("R" git-gutter:set-start-revision))

  (defhydra hydra-zoom ()
    "zoom"
    ("=" zoom-frame-in "in")
    ("-" zoom-frame-out "out"))

  (defhydra hydra-flycheck
    (:pre (progn (setq hydra-lv t) (flycheck-list-errors))
     :post (progn (setq hydra-lv nil) (quit-windows-on "*Flycheck errors*"))
     :hint nil)
    "errors"
    ("f" flycheck-error-list-set-filter "filter")
    ("j" flycheck-next-error "next")
    ("k" flycheck-previous-error "prev")
    ("gg" flycheck-first-error "first")
    ("G" (progn (goto-char (point-max)) (flycheck-previous-error)) "last")
    ("q" nil)
    )

  (defun rpc/gud/prompt-call ()
	(interactive)
	(gud-call (read-string "GUD (call): ")))

  (defun rpc/gud/prompt-print ()
	(interactive)
	(gud-call (format "p %s" (read-string "GUD (print): "))))

  (defhydra hydra-gud
	(:foreign-keys run)
	"GUD"
	("n" gud-next "Next")
	("s" gud-step "Step")
	("c" gud-cont "Continue")
	("p" gud-print "Print")
	("P" rpc/gud/prompt-print "Print expression")
	("B" gud-break "Break")
	("d" gud-remove "Delete breakpoint")
	("R" gud-refresh "Refresh")
	("E" rpc/gud/prompt-call "Execute")
	("Q" nil)
	)

  (defhydra hydra-smerge
	(:foreign-keys run)
	"smerge"
	("n" smerge-next "Next")
	("p" smerge-previous "Previous")
	("RET" smerge-keep-current "Keep Current")
	("Q" nil)
 	)

  )

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((go-mode . lsp)
		 (before-save . lsp-format-buffer))
  )

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends)
  )

(use-package js2-mode
  :ensure t)

(use-package toml-mode
  :ensure t)

(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm
  (setq-local buffer-save-without-query t))

(use-package python-mode
  :ensure t
  :hook (python-mode . lsp)
)

(use-package yaml-mode
	:ensure t)


(use-package restclient
	:ensure t
	:config

(use-package company-restclient
	:ensure t
	:config
	(add-to-list 'company-backends 'company-restclient))
)

(use-package yasnippet
  :ensure t
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(ivy-mode t)
 '(package-selected-packages
   '(racer auctex latex-extra latex-math-preview company-math flappymacs counsel lsp-python-ms python-mode imenus yasnippet company-lsp eglot rust-playground flycheck-ocaml flycheck-rust demangle-mode clippy clang-format+ neotree caml forge key-chord crux ryo-modal perspective company-restclient restclient yaml-mode git-timemachine toml-mode cargo cargo-mode persp-mode tablist elfeed mu4e-alert rust-mode gotest worf smartparens git-gutter-fringe hydra go-eldoc company epresent evil-magit diff-hl badger-theme counsel-projectile projectile cider clojure-mode syndicate evil-surround go-mode eyebrowse magit which-key general use-package))
 '(safe-local-variable-values
   '((rpc/compile/build-command . "cd $(git rev-parse --show-toplevel) && go install cmd/mongosqld/mongosqld.go")
	 (rpc/compile/check-command . "go install")
	 (rpc/compile/check-command . "go install -gcflags='-e'")
	 (rpc/compile/unit-test-command . "go test")
	 (rpc/compile/build-command . "cargo build")
	 (rpc/compile/check-command . "cargo check")
	 (rpc/compile/unit-test-command . "cargo test"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1c1c1c" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 190 :width normal :foundry "nil" :family "Source Code Pro"))))
 '(fringe ((t (:background "#151515"))))
 '(hl-line ((t (:foreground nil :underline nil))))
 '(linum ((t (:inherit (shadow default) :background "#151515"))))
 '(shadow ((t (:foreground "#666666"))))
 '(whitespace-space ((t (:foreground "#353535"))))
 '(whitespace-tab ((t (:foreground "#353535")))))
