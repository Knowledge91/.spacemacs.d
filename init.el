;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
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
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     bibtex
     docker
     octave
     typescript
     yaml
     php
     html
     csv
     python
     markdown
     javascript
     java
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;; better-defaults
     emacs-lisp
     c-c++
     git
     ;; markdown
     org
     (shell :variables shell-default-height 40 shell-default-shell 'multi-term)
     ;; spell-yhecking
     syntax-checking
     ;; version-control
     osx
     gnus
     spotify
     dash
     fasd
     (ranger :variables
             ranger-show-preview t)
     react
     (latex :variables
            latex-build-command "LaTeX"
            latex-enable-auto-fill t)
     theming
     typescript
     ipython-notebook
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(solidity-mode graphql-mode google-c-style color-theme-solarized emojify editorconfig magic-latex-buffer)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7)
                                (agenda . 5))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state nil
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
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
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
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
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
 )

(defun dotspacemacs/user-config ()
  ; solarized theme
  (set-terminal-parameter nil 'background-mode 'dark)
  ;; Get color-theme-solarized working. It is specified as an additional package
  ;; above. First we setup some theme modifications - we must do this *before*
  ;; we load the theme. Note that the color-theme-solarized package appears in
  ;; the list of themes as plain old 'solarized'.
  (setq theming-modifications '((solarized
                                 ;; Provide a sort of "on-off" modeline whereby the current buffer has a nice
                                 ;; bright blue background, and all the others are in cream.
                                 ;; TODO: Change to use variables here. However, got error:
                                 ;; (Spacemacs) Error in dotspacemacs/user-config: Wrong type argument: stringp, pd-blue
                                 (mode-line :foreground "#e9e2cb" :background "#2075c7" :inverse-video nil)
                                 (powerline-active1 :foreground "#e9e2cb" :background "#2075c7" :inverse-video nil)
                                 (powerline-active2 :foreground "#e9e2cb" :background "#2075c7" :inverse-video nil)
                                 (mode-line-inactive :foreground "#2075c7" :background "#e9e2cb" :inverse-video nil)
                                 (powerline-inactive1 :foreground "#2075c7" :background "#e9e2cb" :inverse-video nil)
                                 (powerline-inactive2 :foreground "#2075c7" :background "#e9e2cb" :inverse-video nil)
                                 ;; Make a really prominent helm selection line.
                                 (helm-selection :foreground "white" :background "red" :inverse-video nil)
                                 ;; See comment above about dotspacemacs-colorize-cursor-according-to-state.
                                 (cursor :background "#b58900") )))
  (set-terminal-parameter nil 'background-mode 'dark)
  (set-frame-parameter nil 'background-mode 'dark)
  (spacemacs/load-theme 'solarized)
  (set-frame-parameter nil 'background-mode 'dark)
  (spacemacs/load-theme 'solarized)

  ; projectile-run-project
  (spacemacs/set-leader-keys "pe" 'projectile-run-project)

  ;; solidity
  (require 'solidity-mode)

  ;; latex
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; Turn off js2 mode errors & warnings (we lean on eslint/standard)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)

  ;; js, jsx
  (setq-default
   ;; js2-mode
   js2-basic-offset 2
   js-indent-level 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2
   typescript-indent-level 2)

  (with-eval-after-load 'web-mode
     (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
     (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
     (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

  ;; following https://gist.github.com/zarzen/6218683614c9a645ad5b <- https://www.youtube.com/watch?v=OjbkCEkboA8

  ;; ORG
  (setq org-todo-keywords
        '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(d)" ))) ;; add WAITING
  (setq org-clock-into-drawer "CLOCKING") ;; rename :LOGGING:...
  (setq spaceline-org-clock-p t)
  (setq org-agenda-custom-commands
        '(("p" tags "PROJECT-MAYBE-DONE" nil)
          ("m" tags "PROJECT&MAYBE" nil)
          ("a" "My agenda"
           ((org-agenda-list)
            (tags "PRJOCET-MAYBE-DONE")))
          ))
  (setq org-stuck-projects
        '("+PROJECT/-MAYBE-DONE" ("TODO" "STARTED") nil "\\<IGNORE\\>"))
  (setq org-enforce-todo-dependencies t); ;; todos cannot be DONE before sub-todos are DONE
  (setq org-enforce-todo-checkbox-dependencies t) ;; checkboxes have to be checked for DONE


  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)


  ;; GNUS
  ;; Get email, and store in nnml
  (setq gnus-secondary-select-methods
        '(
          (nnimap "gmail"
                  (nnimap-address
                   "imap.gmail.com")
                  (nnimap-server-port 993)
                  (nnimap-stream ssl))
          ))

  ;; Send email via Gmail:
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-default-smtp-server "smtp.gmail.com")

  ;; Archive outgoing email in Sent folder on imap.gmail.com:
  (setq gnus-message-archive-method '(nnimap "imap.gmail.com")
        gnus-message-archive-group "[Gmail]/Sent Mail")

  ;; set return email address based on incoming email address
  (setq gnus-posting-styles
        '(((header "to" "address@outlook.com")
           (address "address@outlook.com"))
          ((header "to" "address@gmail.com")
           (address "address@gmail.com"))))

  ;; store email in ~/gmail directory
  (setq nnml-directory "~/gmail")
  (setq message-directory "~/gmail")


  (setq gnus-use-full-window nil)  ;; Deactivate full screen

  ;; EMOJI
  (add-hook 'js-mode-hook 'emoji-cheat-sheet-plus-display-mode)

  ;; VTL-syntax heighlighting
  (load-file "~/.spacemacs.d/vtl.el")
  (require 'vtl)
  (setq auto-mode-alist (append '(("\\.vm$" . vtl-mode))
                                auto-mode-alist))


  ;; bash profile
  ;; AWS_ACCOUNTID
  (let ((aws_account_id (shell-command-to-string ". ~/.bash_profile; echo -n $AWS_ACCOUNTID")))
    (setenv "AWS_ACCOUNTID" aws_account_id))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; STYLES
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; c style
  (c-add-style "work"
               '((indent-tabs-mode . nil)
                 (c-basic-offset . 2)
                 (c-offsets-alist
                  (substatement-open . 0)
                  (case-label . +)
                  (inline-open . 0)
                  (block-open . -)
                  (statement-cont . +)
                  (inextern-lang . 0)
                  (innamespace . 0)
                  (arglist-close . 0)
                  (topmost-iktro-cont . +))))
  (setq c-default-style "work")

  ;; php style
  (add-hook 'php-mode-hook 'my-php-mode-hook)
  (defun my-php-mode-hook ()
    "My PHP mode configuration."
    (setq indent-tabs-mode nil
          tab-width 2
          c-basic-offset 2))

  (add-hook 'after-init-hook 'global-emojify-mode)

  ;; graphql for prisma
  (add-to-list 'auto-mode-alist '("\\.prisma\\'" . graphql-mode))

  (add-hook 'term-mode-hook
            (defun my-term-mode-hook ()
              (setq bidi-paragraph-direction 'left-to-right)))

  ;; (add-to-list 'company-backends 'company-tern)
;; term
(defface term-color-black 
  '((t (:foreground "#3f3f3f" :background "#272822"))) 
  "Unhelpful docstring.")
(defface term-color-red
  '((t (:foreground "#cc9393" :background "#272822"))) 
  "Unhelpful docstring.")
(defface term-color-green
  '((t (:foreground "#7f9f7f" :background "#272822"))) 
  "Unhelpful docstring.")
(defface term-color-yellow
  '((t (:foreground "#f0dfaf" :background "#272822"))) 
  "Unhelpful docstring.")
(defface term-color-blue 
  '((t (:foreground "#6d85ba" :background "#272822"))) 

  "Unhelpful docstring.")
(defface term-color-magenta 
  '((t (:foreground "#dc8cc3" :background "#272822"))) 
  "Unhelpful docstring.")
(defface term-color-cyan
  '((t (:foreground "#93e0e3" :background "#272822"))) 
  "Unhelpful docstring.")
(defface term-color-white
  '((t (:foreground "#dcdccc" :background "#272822"))) 
  "Unhelpful docstring.")
'(term-default-fg-color ((t (:inherit term-color-white))))
'(term-default-bg-color ((t (:inherit term-color-black))))

;; ansi-term colors
(setq ansi-term-color-vector
  [term term-color-black term-color-red term-color-green term-color-yellow
    term-color-blue term-color-magenta term-color-cyan term-color-white])

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; setting light background for EIN mode
(defun my-set-theme-on-mode ()
  "set background color depending on file suffix"
  (interactive)
  (let ((fileNameSuffix (file-name-extension (buffer-file-name) ) ))
    (cond
     ((string= fileNameSuffix "ipynb" ) (set-background-color "honeydew"))
     (t (message "%s" "no match found"))
     )
    ))

(add-hook 'find-file-hook 'my-set-theme-on-mode)
)


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(compilation-read-command nil)
 '(evil-want-Y-yank-to-eol nil)
 ;; '(org-agenda-files (quote ("~/todo.org")))
 '(package-selected-packages
   (quote
    (dockerfile-mode docker tablist docker-tramp company-emacs-eclim eclim emojify ht color-theme-solarized color-theme treepy graphql reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl graphql-mode ein request-deferred deferred wolfram-mode tide typescript-mode yasnippet-snippets indium websocket seq company-auctex auctex-latexmk auctex solidity-mode yaml-mode google-c-style org-mime helm-spotify-plus phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode ranger web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data emoji-cheat-sheet-plus company-emoji fasd helm-dash dash-at-point csv-mode spotify helm-spotify multi yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic mmm-mode markdown-toc markdown-mode gh-md xterm-color smeargle shell-pop orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download multi-term magit-gitflow htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit ghub let-alist with-editor eshell-z eshell-prompt-extras esh-help web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode flycheck-pos-tip pos-tip flycheck org-plus-contrib helm-company helm-c-yasnippet company-statistics company-c-headers auto-yasnippet ac-ispell fuzzy company yasnippet auto-complete disaster cmake-mode clang-format ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(safe-local-variable-values
   (quote
    ((projectile-project-run-cmd . "python ./main.py")
     (projectile-project-compilation-cmd . "make -C ./build -j8 default_target")
     (projectile-project-test-cmd . "cd ./FESR && ./build/runUnitTests")
     (projectile-project-run-cmd . "cd ./FESR && ./build/FESR")
     (projectile-project-compilation-cmd . "cd ./FESR && make -C ./build/ -j8 default_target")
     (projectile-project-test-cmd . "./FESR/build/runUnitTests")
     (projectile-project-run-cmd . "./FESR/build/FESR")
     (projectile-project-compilation-cmd . "make -C ./FESR/build/ -j8 default_target")
     (projectile-project-compilation-cmd . "make -C ./build/ -j8 default_target")
     (projectile-project-compilation-cmd . "make -C /Users/knowledge/Developer/PhD/FESR/build/ -j8 default_target")
     (projectile-project-compilation-cmd . "make")
     (projectile-project-test-cmd . "./build/runUnitTests")
     (projectile-project-test-cmd . "./build/FESR")
     (projectile-project-run-cmd . "./build/FESR")
     (helm-make-build-dir . "build/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "#b58900"))))
 '(helm-selection ((t (:foreground "white" :background "red" :inverse-video nil))))
 '(mode-line ((t (:foreground "#e9e2cb" :background "#2075c7" :inverse-video nil))))
 '(mode-line-inactive ((t (:foreground "#2075c7" :background "#e9e2cb" :inverse-video nil))))
 '(powerline-active1 ((t (:foreground "#e9e2cb" :background "#2075c7" :inverse-video nil))))
 '(powerline-active2 ((t (:foreground "#e9e2cb" :background "#2075c7" :inverse-video nil))))
 '(powerline-inactive1 ((t (:foreground "#2075c7" :background "#e9e2cb" :inverse-video nil))))
 '(powerline-inactive2 ((t (:foreground "#2075c7" :background "#e9e2cb" :inverse-video nil)))))
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
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(compilation-read-command nil)
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (doom-modeline centered-cursor-mode counsel swiper window-purpose ivy treemacs visual-fill-column dockerfile-mode docker tablist docker-tramp company-emacs-eclim eclim emojify ht color-theme-solarized color-theme treepy graphql reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl graphql-mode ein request-deferred deferred wolfram-mode tide typescript-mode yasnippet-snippets indium websocket seq company-auctex auctex-latexmk auctex solidity-mode yaml-mode google-c-style org-mime helm-spotify-plus phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode ranger web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data emoji-cheat-sheet-plus company-emoji fasd helm-dash dash-at-point csv-mode spotify helm-spotify multi yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic mmm-mode markdown-toc markdown-mode gh-md xterm-color smeargle shell-pop orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download multi-term magit-gitflow htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit ghub let-alist with-editor eshell-z eshell-prompt-extras esh-help web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode flycheck-pos-tip pos-tip flycheck org-plus-contrib helm-company helm-c-yasnippet company-statistics company-c-headers auto-yasnippet ac-ispell fuzzy company yasnippet auto-complete disaster cmake-mode clang-format ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(safe-local-variable-values
   (quote
    ((projectile-project-run-cmd . "python ./main.py")
     (projectile-project-compilation-cmd . "make -C ./build -j8 default_target")
     (projectile-project-test-cmd . "cd ./FESR && ./build/runUnitTests")
     (projectile-project-run-cmd . "cd ./FESR && ./build/FESR")
     (projectile-project-compilation-cmd . "cd ./FESR && make -C ./build/ -j8 default_target")
     (projectile-project-test-cmd . "./FESR/build/runUnitTests")
     (projectile-project-run-cmd . "./FESR/build/FESR")
     (projectile-project-compilation-cmd . "make -C ./FESR/build/ -j8 default_target")
     (projectile-project-compilation-cmd . "make -C ./build/ -j8 default_target")
     (projectile-project-compilation-cmd . "make -C /Users/knowledge/Developer/PhD/FESR/build/ -j8 default_target")
     (projectile-project-compilation-cmd . "make")
     (projectile-project-test-cmd . "./build/runUnitTests")
     (projectile-project-test-cmd . "./build/FESR")
     (projectile-project-run-cmd . "./build/FESR")
     (helm-make-build-dir . "build/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "#b58900"))))
 '(helm-selection ((t (:foreground "white" :background "red" :inverse-video nil))))
 '(mode-line ((t (:foreground "#e9e2cb" :background "#2075c7" :inverse-video nil))))
 '(mode-line-inactive ((t (:foreground "#2075c7" :background "#e9e2cb" :inverse-video nil))))
 '(powerline-active1 ((t (:foreground "#e9e2cb" :background "#2075c7" :inverse-video nil))))
 '(powerline-active2 ((t (:foreground "#e9e2cb" :background "#2075c7" :inverse-video nil))))
 '(powerline-inactive1 ((t (:foreground "#2075c7" :background "#e9e2cb" :inverse-video nil))))
 '(powerline-inactive2 ((t (:foreground "#2075c7" :background "#e9e2cb" :inverse-video nil)))))
)
