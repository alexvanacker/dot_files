;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Alexis Vanacker"
      user-mail-address "alexvanacker@gmail.com")

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
(setq doom-theme 'doom-vibrant)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; GPG loading
(load! "~/secrets.el")
(setq auth-source-debug t)
(setq auth-sources '("~/.authinfo")
      auth-source-cache-expiry nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/notes/")

;; Custom keybindings
(map! :leader
      :desc "Go to inbox.org"
      :g "oi" (lambda () (interactive) (find-file "~/Dropbox/notes/inbox.org")))
(map! :leader
      :desc "Go to clock report"
      :g "oc" (lambda () (interactive (find-file "~/Dropbox/notes/clockreport.org"))))

;; Deft configuration
(setq deft-directory "~/Dropbox/notes/")
(setq deft-recursive t)
(setq deft-default-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title nil)
(setq deft-use-filter-string-for-filename t)

;; My org configuration
(after! org
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/notes/gtd.org" "Tasks")
         "* TODO  %?\n  %i\n ")
        ("i" "Idea" entry (file+headline "~/Dropbox/notes/gtd.org" "Tasks")
         "* IDEA %?\n %i\n %a")
        ("m" "Note (Meeting)" entry (file "~/Dropbox/notes/inbox.org")
         "* %U Meeting - %?\n" :clock-in t :clock-keep t)
        ("a" "Note (Action)" entry (file "~/Dropbox/notes/inbox.org")
         "* %U %?\n" :clock-in t :clock-keep t)
        ("L" "Link from protocol" entry (file "~/Dropbox/notes/inbox.org")
         "* TODO [[%:link][%:description]] \n%?\n" :clock-keep t :jump-to-captured t)))
;; org-agenda
(setq org-agenda-files (quote ("~/Dropbox/notes")))
(setq org-agenda-tag-filter-preset '("-personal"))
(setq org-todo-keywords
      '((sequence "IDEA" "TODO" "NEXT" "WAITING(/!)" "|" "DONE")))
(setq org-log-into-drawer t)
(setq org-clock-out-remove-zero-time-clocks t)
(setq org-agenda-prefix-format '((agenda . " %i %b %-12:c%?-12t% s")
                                 (timeline . "  % s")
                                 (todo . " %i %b %-12:c")
                                 (tags . " %i %b %-12:c")
                                 (search . " %i %b %-12:c")))
(setq org-agenda-start-day nil)
(setq org-agenda-custom-commands
      '(("A" "Agenda and tasks"
         ((agenda "")
          (todo "WAITING|TODO|NEXT"
                )))
        ("D" "Day agenda and tasks"
         ((agenda "" ((org-agenda-span 1)))
          (todo "WAITING|TODO|NEXT"
                )))))
(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path 'file)
(setq org-refile-allow-creating-parent-nodes 'confirm))

;; Open Magit by default when switching to project
(setq projectile-switch-project-action 'projectile-vc)

;; Plantuml
(setq org-plantuml-jar-path (concat
                             (getenv "DEVENV")
                             "/plantuml.jar"))

;; Mermaid JS Supprot
(setq ob-mermaid-cli-path "~/devenv/mermaid-cli/node_modules/.bin/mmdc")

;; Google calendar setup
;; Note: some loaded via secrets.el.gpg
(setq org-gcal-fetch-file-alist
      '(("alexis.vanacker@concordnow.com" .  "~/Dropbox/notes/gcal.org")))
;; Issue with org-indent-timer see https://github.com/seagle0128/.emacs.d/issues/129
(setq org-gcal-remove-api-cancelled-events t)

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
