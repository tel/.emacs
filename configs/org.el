
(eval-after-load "org-mode"
  '(progn 

     (global-set-key (kbd "C-c l") 'org-store-link)
     (global-set-key (kbd "C-c a") 'org-agenda)
     (global-set-key (kbd "C-c r") 'org-capture)
     (global-set-key (kbd "C-c g") 'org-clock-goto)
     
     (setq org-fast-tag-selection-single-key     'expert
	   org-use-fast-todo-selection           t
	   org-agenda-skip-deadline-if-done      t
	   org-agenda-skip-scheduled-if-done     t
	   org-reverse-note-order                t
	   org-clock-out-remove-zero-time-clocks t

	   org-icalendar-include-todo            t
	   org-combined-agenda-icalendar-file
	     "/Library/WebServer/Documents/org.ics"

	   org-treat-S-cursor-todo-selection-as-state-change nil
	   org-agenda-time-grid   '((daily require-timed)
				    "--------------------"
				    (800 1000 1200 1400 1600 1800 2000 2200))

	   org-tag-alist '((:startgroup) ("@errand" . ?e)
			                 ("@office" . ?o)
					 ("@phone" . ?p)
					 ("@email" . ?e)
					 ("@home" . ?H)
			   (:endgroup)   ("WAITING" . ?w)
			                 ("HOLD" . ?h)
					 ("PERSONAL" . ?P)
					 ("WORK" . ?W)
					 ("ORG" . ?O)

					 ("crypt" . ?E)
					 ("NOTE" . ?n)
					 ("CANCELLED" . ?c)
					 ("FLAGGED" . ??))

	   org-todo-keywords '((sequence "TODO(t!)" 
                                         "NEXT(n!)"
					 "|"
					 "DONE(d!/!)")
			       (sequence "WAITING(w@/!)"
					 "HOLD(h@/!)"
					 "|"
					 "CANCELLED(c@/!)"
					 "PHONE"))
	   
	   org-todo-keyword-faces '(("TODO" :foreground "red" :weight bold)
				    ("NEXT" :foreground "blue" :weight bold)
				    ("DONE" :foreground "forest green" :weight bold)
				    ("WAITING" :foreground "orange" :weight bold)
				    ("HOLD" :foreground "magenta" :weight bold)
				    ("CANCELLED" :foreground "forest green" :weight bold)
				    ("PHONE" :foreground "forest green" :weight bold))

	   org-todo-state-tags-triggers '(("CANCELLED" ("CANCELLED" . t))
					  ("WAITING" ("WAITING" . t))
					  ("HOLD" ("WAITING" . t) ("HOLD" . t))
					  (done ("WAITING") ("HOLD"))
					  ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
					  ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
					  ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))

	   org-agenda-custom-commands 
	     '( ("d" todo "DELEGATED" nil)
		("p" tags "PROJECT-MAYBE-DONE" nil)
		("P" todo "PROJECT-MAYBE-DONE" nil)
		("m" tags "PROJECT&MAYBE" nil)
		("c" todo "DONE|DEFERRED|CANCELLED" nil)
		("w" todo "WAITING" nil)
		("W" agenda "" ((org-agenda-ndays 21)))

		("N" "Notes" tags "NOTE"
		 ((org-agenda-overriding-header "Notes")
		  (org-tags-match-list-sublevels t)))

		("A" agenda ""
		 ((org-agenda-skip-function
		   (lambda nil
		     (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
		  (org-agenda-ndays 1)
		  (org-agenda-overriding-header "Today's Priority #A tasks: ")))

		("r" "Tasks to Refile" tags "REFILE"
		 ((org-agenda-overriding-header "Tasks to Refile")
		  (org-tags-match-list-sublevels nil)))

		("u" alltodo ""
		 ((org-agenda-skip-function
		   (lambda nil
		     (org-agenda-skip-entry-if (quote scheduled) (quote deadline)
					       (quote regexp) "<[^>\n]+>")))
		  (org-agenda-overriding-header "Unscheduled TODO entries: "))))
	   

  
	   org-default-notes-file "~/Dropbox/org/refile.org"

	   org-capture-templates '(("t" "todo" entry (file "~/Dropbox/org/refile.org")
				    "* TODO %?\n%U\n%a\n  %i" :clock-in t :clock-resume t)
				   ("n" "note" entry (file "~/Dropbox/org/refile.org")
				    "* %? :NOTE:\n%U\n%a\n  %i" :clock-in t :clock-resume t)
				   ("j" "Journal" entry (file+datetree "~/Dropbox/org/diary.org")
				    "* %?\n%U\n  %i" :clock-in t :clock-resume t)
				   ("w" "org-protocol" entry (file "~/Dropbox/org/refile.org")
				    "* TODO Review %c\n%U\n  %i" :immediate-finish t)
				   ("p" "Phone call" entry (file "~/Dropbox/org/refile.org")
				    "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
				   ("h" "Habit" entry (file "~/Dropbox/org/refile.org")
				    "* NEXT %?\n%U\n%a\nSCHEDULED: %t .+1d/3d\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n  %i"))

	   org-refile-targets '((nil . (:maxlevel . 9))
				(org-agenda-files . (:maxlevel . 9)))

	   org-outline-path-complete-in-steps nil
	   org-refile-allow-creating-parent-nodes 'confirm

	   org-completion-use-ido t

	   ) ;; end setq

     ))
