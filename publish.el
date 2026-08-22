(require 'ox-publish)

(setq org-html-validation-link nil)
(setq org-html-head-extra
      (concat
       "<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">"
       "<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>"
       "<link href=\"https://fonts.googleapis.com/css2?family=Source+Serif+4:ital,opsz,wght@0,8..60,200..900;1,8..60,200..900&display=swap\" rel=\"stylesheet\">"
       "<link rel=\"stylesheet\" href=\"/css/style.css\" type=\"text/css\"/>"))

(setq org-publish-project-alist
      '(("posts"
         :base-directory "./org/posts"
         :base-extension "org"
         :publishing-directory "./public/posts"
         :recursive t
         :publishing-function org-html-publish-to-html

         :with-toc nil
         :with-author nil
         :with-timestamps nil
         :with-creator nil
         :section-numbers nil

         :auto-sitemap t
         :sitemap-filename "index.org"
         :sitemap-title "Blog"
         :sitemap-style list
         :sitemap-sort-files anti-chronologically)

        ("blog"
         :recursive t
         :base-directory "./org"
         :base-extension "org"
         :publishing-directory "./public"
         :publishing-function org-html-publish-to-html
         :section-numbers nil
         :exclude "posts/"

         :with-toc nil
         :with-author nil
         :with-timestamps nil
         :with-creator nil)

        ("static"
         :base-directory "./org"
         :base-extension "css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|svg\\|webp"
         :publishing-directory "./public"
         :recursive t
         :publishing-function org-publish-attachment)

        ("site"
         :components ("posts" "blog" "static"))))

(org-publish-project "site" t)
(message "build complete!")
