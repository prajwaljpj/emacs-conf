;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Prajwal Rao"
      user-mail-address "rao199@purdue.edu")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.




;; GCALENDAR

;; (setq org-gcal-client-id "<SOME_ID>.apps.googleusercontent.com"
;;       org-gcal-client-secret "<SOME_SECRET>"
;;       org-gcal-fetch-file-alist '(("<USERNAME>@gmail.com" . "~/Dropbox/Org/gcal-agenda.org")))
;; (after! org-gcal
;;   (load! "lisp/private/+org-gcal.el"))

;; open jupyter after conda env

;; (after! anaconda-mode
;;   ;; Set ein jupyter executable variable to the conda env variable
;;   (setq ein:jupyter-default-server-command
;;         (concat conda-env-current-path "/bin/jupyter")
;;         )
;;   )

;; (concat conda-env-current-path "/bin/jupyter")

;; visual line mode by default when ein is active

(after! ein
  (setq! visual-line-mode t)
  )

(setq +latex-viewers '(zathura))
(after! tex
  (setq TeX-view-program-selection
        '(
          (output-pdf "zathura")
          (output-pdf "PDF Tools")
          (output-pdf "Okular")
          (output-pdf "preview-pane")
          ((output-dvi has-no-display-manager)
           "dvi2tty")
          ((output-dvi style-pstricks)
           "dvips and gv")
          (output-dvi "xdvi")
          (output-pdf "Evince")
          (output-html "xdg-open")
          )))


;; (use-package! pdf-tools
;;   :config
;;   (setenv "PKG_CONFIG_PATH" "/opt/homebrew/opt/libffi/lib/pkgconfig/:/opt/homebrew/Cellar/zlib/1.2.12_1/lib/pkgconfig:/usr/lib/pkgconfig/local/lib/pkgconfig:/opt/X11/lib/pkgconfig:/opt/homebrew/opt/libffi/lib/pkgconfig/:/usr/local/Cellar/zlib/1.2.12/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/X11/lib/pkgconfig:/usr/local/Cellar/poppler/22.06.0_1/lib/pkgconfig:/opt/x11/share/pkgconfig:/opt/homebrew/opt/libffi/lib/pkgconfig/:/usr/local/Cellar/zlib/1.2.12/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/X11/lib/pkgconfig:/opt/homebrew/Cellar/poppler/22.08.0/lib/pkgconfig:/opt/x11/share/pkgconfig:/opt/homebrew/Cellar/libpng/1.6.38/lib/pkgconfig:/opt/homebrew/Cellar/glib/2.74.0/lib/pkgconfig")
;;   ;; (pdf-tools-install)
;;   (custom-set-variables
;;    '(pdf-tools-handle-upgrades t)))


;; Set banner to purdue banner
(setq fancy-splash-image "~/.doom.d/resized_train_front.png")

;; Keybindings for split and open
;; https://discourse.doomemacs.org/t/open-selected-completion-candidate-in-a-split/2525
(defun mega/vsplit-file-open (f)
  (let ((evil-vsplit-window-right t))
    (+evil/window-vsplit-and-follow)
    (find-file f)))

(defun mega/split-file-open (f)
  (let ((evil-split-window-below t))
    (+evil/window-split-and-follow)
    (find-file f)))

(map! :after embark
      :map embark-file-map
      "V" #'mega/vsplit-file-open
      "X" #'mega/split-file-open)

;; (after! tex
;;   (setq TeX-view-program-selection nil)
;;   ;; (load! "../.emacs.d/modules/lang/latex/+viewers")
;;   (setq +latex-viewers '(zathura))
;;   )
(setq pythonic-interpreter "python3")
(setq python-shell-interpreter "python3")
(after! org
  (setq org-babel-python-command "python3"))
(setq lsp-pyright-python-executable-cmd "python3")
(setq lsp-python-ms-python-executable-cmd "python3")
(after! lsp-ui
  (setq! lsp-ui-doc-delay 0.0))


;; Read env vars from .profile/.bash_profile/.bashrc
(use-package! exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package! org-ai
  :ensure t
  :load-path (lambda () "~/.config/emacs/.local/straight/repos/org-ai")
  :init
  (add-hook 'org-mode-hook #'org-ai-mode)
  (org-ai-global-mode) ; installs global keybindings on C-c M-a
  :config
  (setq org-ai-openai-api-token (getenv "CHATGPT_API_KEY"))
  (setq org-ai-default-chat-model "gpt-4") ; if you are on the gpt-4 beta:
  (org-ai-install-yasnippets)
  )

(use-package! gptel
  :config
  (setq! gptel-api-key (getenv "CHATGPT_API_KEY")))
;; (use-package! org-ai
;;   :ensure t
;;   :commands (org-ai-mode
;;              org-ai-global-mode)
;;   ;;   :init
;;   ;;   (add-hook 'org-mode-hook #'org-ai-mode) ; enable org-ai in org-mode
;;   ;;   (org-ai-global-mode) ; installs global keybindings on C-c M-a
;;   ;; :config
;;   ;; (setq org-ai-default-chat-model "gpt-4") ; if you are on the gpt-4 beta:
;;   ;; (org-ai-install-yasnippets)
;;   )
;; (setq org-ai-global-mode t)

;; (after! org-ai
;;   (setq org-ai-default-chat-model "gpt-4"))
;; (add-hook! 'org-mode-hook #'org-ai-mode t)

;; (global-set-key )
(map! :leader
      (:prefix ("j" . "AI")
       :desc "gptel"
       "f" #'gptel-send
       "p" #'org-ai-prompt))





(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package! simple-httpd
  :ensure t)

;; (use-package! org-ref
;;   :ensure t)

(use-package! org-ref

  ;; this bit is highly recommended: make sure Org-ref is loaded after Org
  :after org

  ;; Put any Org-ref commands here that you would like to be auto loaded:
  ;; you'll be able to call these commands before the package is actually loaded.
  :commands
  (org-ref-cite-hydra/body
   org-ref-bibtex-hydra/body)

  ;; if you don't need any autoloaded commands, you'll need the following
  ;; :defer t

  ;; This initialization bit puts the `orhc-bibtex-cache-file` into `~/.doom/.local/cache/orhc-bibtex-cache
  ;; Not strictly required, but Org-ref will pollute your home directory otherwise, creating the cache file in ~/.orhc-bibtex-cache
  :init
  (let ((cache-dir (concat doom-cache-dir "org-ref")))
    (unless (file-exists-p cache-dir)
      (make-directory cache-dir t))
    (setq orhc-bibtex-cache-file (concat cache-dir "/orhc-bibtex-cache"))))

(after! org
  (require 'org-ref))

;; custom latex class
(after! ox-latex
  (add-to-list 'org-latex-classes
               '("org-plain-latex"
                 "\\documentclass{article}
           [NO-DEFAULT-PACKAGES]
           [PACKAGES]
           [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  (add-to-list 'org-latex-classes
               '("article2"
                 "\\documentclass[11pt,a4paper]{article}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{fixltx2e}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage[normalem]{ulem}
\\usepackage{amsmath}
\\usepackage{textcomp}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{amssymb}
\\usepackage{hyperref}
\\usepackage{mathpazo}
\\usepackage{color}
\\usepackage{enumerate}
\\definecolor{bg}{rgb}{0.95,0.95,0.95}
\\tolerance=1000
      [NO-DEFAULT-PACKAGES]
      [PACKAGES]
      [EXTRA]
\\linespread{1.1}
\\hypersetup{pdfborder=0 0 0}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")))

  (add-to-list 'org-latex-classes
               '("mimore"
                 "\\\\documentclass{mimore}
\[NO-DEFAULT-PACKAGES\]
\[PACKAGES\]
\[EXTRA\]"
                 ("\\\\section{%s}" . "\\\\section\*{%s}")
                 ("\\\\subsection{%s}" . "\\\\subsection\*{%s}")
                 ("\\\\subsubsection{%s}" . "\\\\subsubsection\*{%s}")
                 ("\\\\paragraph{%s}" . "\\\\paragraph\*{%s}")
                 ("\\\\subparagraph{%s}" . "\\\\subparagraph\*{%s}"))))
(after! org
  '(org-latex-listings t)
  '(org-latex-listings-langs (quote ((emacs-lisp "Lisp")
                                     (lisp "Lisp")
                                     (clojure "Lisp")
                                     (c "C")
                                     (cc "C++")
                                     (fortran "fortran")
                                     (perl "Perl")
                                     (cperl "Perl")
                                     (python "Python")
                                     (ruby "Ruby")
                                     (html "HTML")
                                     (xml "XML")
                                     (tex "TeX")
                                     (latex "[LaTeX]TeX")
                                     (shell-script "bash")
                                     (gnuplot "Gnuplot")
                                     (ocaml "Caml")
                                     (caml "Caml")
                                     (sql "SQL")
                                     (sqlite "sql")
                                     (R-mode "R")))))

(setq +python-ipython-repl-args '("-i" "--simple-prompt" "--no-color-info"))
(setq +python-jupyter-repl-args '("--simple-prompt"))
