;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(go
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     ;; git
     helm
     (lsp :variables
          lsp-rust-server 'rust-analyzer)
     ;; markdown
     multiple-cursors
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     treemacs
     auto-completion
     docker
     git
     rust
     restclient
     markdown
     (org :variables
          org-enable-reveal-js-support t
          org-enable-github-support t
          )
     deft
     csv
     google-calendar
     html
     asciidoc
     (python :variables
             python-backend 'anaconda)
     yaml
     (javascript :variables
                 js2-mode-show-strict-warnings nil)
     shell-scripts
     sql
     (clojure :variables
              clojure-enable-linters 'clj-kondo)
     react
     (terraform :variables terraform-backend 'lsp)
     (java :variables java-backend 'lsp)
     (plantuml :variables
               plantuml-jar-path "~/devenv/plantuml.jar"
               org-plantuml-jar-path "~/devenv/plantuml.jar")
     syntax-checking
     emberjs
     treemacs
     (ruby :variables ruby-backend 'lsp))


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      ag
                                      editorconfig
                                      forge
                                      yasnippet-snippets
                                      code-review
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-dark
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
)

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
)


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
)


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'org-protocol)
  (load "~/.emacs.d/custom.el")
  (with-eval-after-load 'cider
    (setq cider-repl-pop-to-buffer-on-connect t))
  ;; handle encrypted values
  (load-library "~/secrets.el.gpg")
  (use-package forge
    :after magit)
  ;; Fix M-RET not being a shortcut in org-mode
  ;; cf. https://github.com/syl20bnr/spacemacs/issues/9603
  (with-eval-after-load 'org
    (org-defkey org-mode-map [(meta return)] 'org-meta-return)
    (add-to-list 'org-modules 'org-protocol)

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
             "* TODO [[%:link][%:description]] \n%?\n" :clock-keep t :jump-to-captured t))))
  ;; org-agenda
  (setq org-agenda-files (quote ("~/Dropbox/notes")))
  (setq org-agenda-tag-filter-preset '("-personal"))
  (spacemacs/set-leader-keys "oc" (lambda () (interactive (find-file "~/Dropbox/notes/clockreport.org"))))
  (setq org-todo-keywords
        '((sequence "IDEA" "TODO" "NEXT" "WAITING(/!)" "|" "DONE")))
  (setq org-log-into-drawer t)
  (setq org-clock-out-remove-zero-time-clocks t)
  (setq org-agenda-prefix-format '((agenda . " %i %b %-12:c%?-12t% s")
                                  (timeline . "  % s")
                                  (todo . " %i %b %-12:c")
                                  (tags . " %i %b %-12:c")
                                  (search . " %i %b %-12:c")))
  (setq org-agenda-custom-commands
        '(("A" "Agenda and tasks"
           ((agenda "")
            (todo "WAITING|TODO|NEXT"
                  )))
          ("D" "Day agenda and tasks"
           ((agenda "" ((org-agenda-span 1)))
            (todo "WAITING|TODO|NEXT"
                  )))))
  (setq org-journal-dir "~/Dropbox/notes/journal/")
  (setq org-journal-date-format "%A, %d %B %Y")
  (setq org-refile-targets '((nil :maxlevel . 9)
                             (org-agenda-files :maxlevel . 9)))
  (setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
  (setq org-refile-use-outline-path 'file)
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  (setq org-link-abbrev-alist
        '(("concord-jira" . "https://contractlive.atlassian.net/browse/")))
  (setq org-re-reveal-root "file:///home/alexvanacker/devenv/reveal.js/reveal.js-4.2.1/")
  (setq org-re-reveal-revealjs-version "4")
  (setq org-re-reveal-theme "moon")
  ;; Org clock
  (spacemacs/toggle-mode-line-org-clock-on)
  ;; Blogging - export
  (setq org-publish-project-alist
        '(

          ("org-alexvanacker"
           ;; Path to your org files.
           :base-directory "~/git/alexvanacker.github.io/org/"
           :base-extension "org"

           ;; Path to your Jekyll project.
           :publishing-directory "~/git/alexvanacker.github.io/jekyll/"
           :recursive t
           :publishing-function org-html-publish-to-html
           :headline-levels 4
           :html-extension "html"
           :body-only t ;; Only export section between <body> </body>
           )

          ("org-static-alexvanacker"
           :base-directory "~/git/alexvanacker.github.io/org/"
           :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
           :publishing-directory "~/git/alexvanacker.github.io/"
           :recursive t
           :publishing-function org-publish-attachment)

          ("alexvanacker" :components ("org-alexvanacker" "org-static-alexvanacker"))))
  ;; Shortcuts / Keybindings
  (spacemacs/declare-prefix "o" "custom")
  (spacemacs/set-leader-keys "od" 'deft)
  (spacemacs/set-leader-keys "pA" 'projectile-ag)
  (spacemacs/set-leader-keys "or" 'code-review-forge-pr-at-point)
  (spacemacs/declare-prefix-for-mode 'magit-mode "mo" "custom")
  (spacemacs/set-leader-keys-for-major-mode 'magit-mode "op" 'forge-list-requested-reviews)
  (setq deft-directory "~/Dropbox/notes/")
  (setq deft-recursive t)
  (setq deft-default-extension "org")
  (setq deft-text-mode 'org-mode)
  (setq deft-use-filename-as-title nil)
  (setq deft-use-filter-string-for-filename t)
  ;; Open magit by default when switching projects
  (setq projectile-switch-project-action 'projectile-vc)
  ;; Shortcuts
  (spacemacs/set-leader-keys "oi" (lambda () (interactive) (find-file "~/Dropbox/notes/inbox.org")))
  ;; org-gcal -- some in secrets.el
  (setq org-gcal-fetch-file-alist
        '(("alexis.vanacker@concordnow.com" .  "~/Dropbox/notes/gcal.org")))
  ;; Issue with org-indent-timer see https://github.com/seagle0128/.emacs.d/issues/129
  (setq org-gcal-remove-api-cancelled-events t)
  (org-reload)
  ;; Python
  (setq flycheck-python-pycompile-executable "python3")
  ;; JS
  (setq ember-completion-system 'helm)
  ;; Workaround https://github.com/syl20bnr/spacemacs/issues/15089
  (setq auto-mode-alist (delete '("/git-rebase-todo$" . helm-ls-git-rebase-todo-mode) auto-mode-alist))
  (org-gcal-fetch)
  )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(highlight-parentheses-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(org-agenda-files
   '("/home/alexvanacker/Dropbox/notes/concord-api.org" "/home/alexvanacker/Dropbox/notes/1o1_Renald.org" "/home/alexvanacker/Dropbox/notes/2020-02-24T1053-watchman-cs-passover.org" "/home/alexvanacker/Dropbox/notes/2020-02-26T0846.org" "/home/alexvanacker/Dropbox/notes/2020-03-03T1556.org" "/home/alexvanacker/Dropbox/notes/2020-03-03T1657.org" "/home/alexvanacker/Dropbox/notes/2020-03-03T1831.org" "/home/alexvanacker/Dropbox/notes/2020-03-03T2153.org" "/home/alexvanacker/Dropbox/notes/2020-03-04T2246.org" "/home/alexvanacker/Dropbox/notes/2020-03-06T2222.org" "/home/alexvanacker/Dropbox/notes/2020-03-11T2218.org" "/home/alexvanacker/Dropbox/notes/2020-03-12T1013.org" "/home/alexvanacker/Dropbox/notes/2020-03-18T1315.org" "/home/alexvanacker/Dropbox/notes/2020-03-25T1137.org" "/home/alexvanacker/Dropbox/notes/2020-04-15T1429.org" "/home/alexvanacker/Dropbox/notes/2020-04-16T0849.org" "/home/alexvanacker/Dropbox/notes/2020-04-22T1347.org" "/home/alexvanacker/Dropbox/notes/2020-05-06T1533.org" "/home/alexvanacker/Dropbox/notes/2020-05-19T1134.org" "/home/alexvanacker/Dropbox/notes/2020-05-25T1011.org" "/home/alexvanacker/Dropbox/notes/2020-05-28T2125.org" "/home/alexvanacker/Dropbox/notes/2020-09-15T1658.org" "/home/alexvanacker/Dropbox/notes/2020-09-24T2338.org" "/home/alexvanacker/Dropbox/notes/2020-09-25T1708.org" "/home/alexvanacker/Dropbox/notes/2020-10-03T1519.org" "/home/alexvanacker/Dropbox/notes/20201002233931_migration_cute_pdfbox.org" "/home/alexvanacker/Dropbox/notes/20201011215938-document_security_store.org" "/home/alexvanacker/Dropbox/notes/2021-03-18T2236.org" "/home/alexvanacker/Dropbox/notes/2021-04-01T1114.org" "/home/alexvanacker/Dropbox/notes/2021-07-05T1810.org" "/home/alexvanacker/Dropbox/notes/CPM-10369 Autorequest.org" "/home/alexvanacker/Dropbox/notes/CPM-11342 Corner cases.org" "/home/alexvanacker/Dropbox/notes/CPM-1160-just-eat-sso-duplicates.org" "/home/alexvanacker/Dropbox/notes/Dependency review.org" "/home/alexvanacker/Dropbox/notes/Epic-CPM-10370-signature-auto-reminder.org" "/home/alexvanacker/Dropbox/notes/Ernest.org" "/home/alexvanacker/Dropbox/notes/Mentoring Sandro Alcamo.org" "/home/alexvanacker/Dropbox/notes/Paris tennis.org" "/home/alexvanacker/Dropbox/notes/agreegator.org" "/home/alexvanacker/Dropbox/notes/bcm.org" "/home/alexvanacker/Dropbox/notes/beyond classics website.org" "/home/alexvanacker/Dropbox/notes/budget.org" "/home/alexvanacker/Dropbox/notes/clockreport.org" "/home/alexvanacker/Dropbox/notes/creation_source.org" "/home/alexvanacker/Dropbox/notes/dontstarvetogether.org" "/home/alexvanacker/Dropbox/notes/gcal.org" "/home/alexvanacker/Dropbox/notes/gtd.org" "/home/alexvanacker/Dropbox/notes/happypal.org" "/home/alexvanacker/Dropbox/notes/hiring.org" "/home/alexvanacker/Dropbox/notes/iff_sso_preparation.org" "/home/alexvanacker/Dropbox/notes/immutables.org" "/home/alexvanacker/Dropbox/notes/inbox.org" "/home/alexvanacker/Dropbox/notes/infra-ami-update-no-downtime.org" "/home/alexvanacker/Dropbox/notes/integrationtests.org" "/home/alexvanacker/Dropbox/notes/journal.org" "/home/alexvanacker/Dropbox/notes/justeat-email-migration.org" "/home/alexvanacker/Dropbox/notes/memory-leak.org" "/home/alexvanacker/Dropbox/notes/numerical.org" "/home/alexvanacker/Dropbox/notes/personal.org" "/home/alexvanacker/Dropbox/notes/phone.org" "/home/alexvanacker/Dropbox/notes/pricing-2020.org" "/home/alexvanacker/Dropbox/notes/signature-snapshots.org" "/home/alexvanacker/Dropbox/notes/signer-migration.org" "/home/alexvanacker/Dropbox/notes/signer_panel_epic.org" "/home/alexvanacker/Dropbox/notes/spring_data.org" "/home/alexvanacker/Dropbox/notes/spring_secu_oauth_upgrade.org" "/home/alexvanacker/Dropbox/notes/use_template_api.org"))
 '(org-export-backends '(ascii html icalendar latex md odt org re-reveal))
 '(package-selected-packages
   '(code-review emojify seeing-is-believing rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby helm-gtags godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc ggtags flycheck-golangci-lint counsel-gtags counsel swiper ivy company-go go-mode ember-yasnippets ember-mode lsp-ui lsp-python-ms lsp-pyright lsp-origami origami lsp-java dap-mode lsp-treemacs bui helm-lsp lsp-mode mvn meghanada groovy-mode groovy-imports pcache solarized-theme emacsql-sqlite3 helm-ls-git evil-collection imenu-list plantuml-mode treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil treemacs cfrs ht posframe symbol-overlay sphinx-doc pipenv org-superstar org-re-reveal org-brain magit-section emr list-utils editorconfig package-lint window-purpose ctable all-the-icons csv-mode ox-jira org-jira oauth2 spotify company-emacs-eclim eclim ox-gfm persist request-deferred deferred calfw org-gcal flycheck-rust flycheck-pos-tip flycheck insert-shebang fish-mode company-shell terraform-mode hcl-mode ansible-doc ansible strace-mode org-cliplink deft org-roam org-journal yasnippet-classic-snippets ox-reveal maven-test-mode apib-mode yasnippet-snippets gnu-elpa-keyring-update web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot adoc-mode markup-faces ox-asciidoc ag ghub closql emacsql-sqlite emacsql treepy forge yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic mmm-mode markdown-toc gh-md yaml-mode dockerfile-mode docker tablist docker-tramp web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern dash-functional tern coffee-mode restclient-helm ob-restclient ob-http company-restclient restclient know-your-http-well toml-mode racer pos-tip cargo markdown-mode rust-mode sql-indent smeargle orgit magit-gitflow magit-popup helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy evil-magit magit transient git-commit with-editor company-statistics company clojure-snippets auto-yasnippet ac-ispell auto-complete evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args evil-anzu anzu evil undo-tree clj-refactor inflections edn spinner queue adaptive-wrap multiple-cursors paredit yasnippet peg cider-eval-sexp-fu cider sesman parseedn clojure-mode parseclj a ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline smartparens restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-unimpaired evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-escape goto-chg eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e"))
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#839496" :background "#002b36")))))
)
