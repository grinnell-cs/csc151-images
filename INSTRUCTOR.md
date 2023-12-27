Instructor Notes for CSC151
===========================

We use a combination of GitHub/git, Jekyll, and Bookstrap to manage
the CSC-151 site.  This file provides some basic guidance about how
everything is managed.

Setting up
----------

Download from GitHub.  Here's a typical command.

    git clone git@github.com:grinnell-cs/csc151-images.git 

Once you have done so, you should do most of the work in the directory.

Make sure you have Ruby and Bundler installed on your machine.  On the
Mac, I tend to use Homebrew to get the latest versions installed.  I
believe we have them installed in MathLAN.

    brew install ruby
    gem install bundler

Normally, once you have downloaded the repo, you should have a `Gemfile`,
but not a `Gemfile.lock`.  If you have `Gemfile.lock`, remove it.

Next, run `bundle install`.  This should install Jekyll and other tools
you'll need to build the site.

    bundle install

Check to see that the site is available with `tasks/serve` (see below
for more details).

Try the server.

    tasks serve

Check which branches are available.  If there's already one for your
course, use it.  If there's not one for your course, create it.

Try the server again.

Edit the various files (see below).

Try the server again.

Primary commands
----------------

`tasks/build`
  : Build the site locally.  Used mostly in preparation for other actions,
    such as deploying.  Can also be good for tracking down errors.

`tasks/deploy`
  : Deploy the site from your local machine to the Web server.

`tasks/loop`
  : Call `deploy` every minute.  Used mostly by SamR, who updates "live"
    in class.

`tasks/serve`
  : Run a server locally for testing.

Files to edit
-------------

These are some of the files that are most frequently edited. Make
sure to look at them as you prepare to deploy a course.

You can, of course, edit any file; our focus here is mostly on configuring
the course.

### Branch-specific

`_config.yml`
  : General site configuration.  Instructor, class hours, things like that.

`tasks/deploy`
  : Instructions for deploying to your Web server

`pages/syllabus.md`
  : The course syllabus/front door.

`_data/nav.yml`
  : The navigation bar. Most of this is common. However, links to Teams and Gradescope are usually specific to each section.

### Common (updated each semester)

Usually, one person updates all of these at the beginning of the semester. We then modify them throughout the semester (sometimes the common version, sometimes individual versions).

`_data/dates.yml`
  : The dates for the semester.  

`_data/classes.yml`
  : The list of class topics, in order.

`_data/due-dates.yml`
  : Due dates and some other extra information.

`_data/weeks.yml`
  : Titles of individual weeks.

`_data/bundles.yml`
  : The information on grading policies.

Updating
--------

We tend to use informal Git strategies (e.g., push rather than pull requests).
If you make changes to shared files, please make them in the main branch
and then merge them into your branch.  If you make changes appropriate
primarily for your class, please do those in your branch.

Here's one workflow.

Start by getting any recent changes.

    git checkout main
    git pull
    git checkout BRANCH
    git pull
    git merge main

Start the server

    tasks/serve # Probably in a separate window.

Edit files, verifying that they look okay

Prepare to push changes

    git checkout main
    git pull
    git add CHANGED-COMMON-FILES
    git commit -m MESSAGE
    git push

Merge changes into branch

    git checkout BRANCH
    git pull
    git merge main
    git commit CHANGED-PERSONAL-FILES
    git commit -m MESSAGE
    git push

Organization
------------

### Content

`_eboards` 
  : Live notes, used mostly in SamR's sections.

`_handouts` 
  : The primary handouts for the course (including a bunch of Sam's
    policies, which you can feel free to either eliminate or hide
    in your branch).

`_labs`
  : The labs. Well, the Web pages that introduce the labs. Most of
    the labs are `.rkt` or `.scm` files that live in `code/labs`.

`_las`
  : Sample learning assessments. We post the actual learning
    assessments to Gradescope or distribute them on paper.

`_mps`
  : The mini-projects (homework assignments). We normally set the
    `link` field to `false` until we release them.

`_readings`
  : The daily readings for the course.

`code`
  : Code we provide to the students (mostly code for the labs and
    started code for the mini-projects).

`images`
  : Images for the readings, labs, and mini-projects. At some point,
    we may want to restructure this directory.

`pages`
  : The primary pages. These include the syllabus, the schedule, and
    the indicies for the various sections of the site (handouts,
    mini-projects, labs, readings, etc.).

### Configuration and such

`_data` 
  : Information about the class, including due dates. See details on
    individual files above.

`_includes`
  : Standard templates and parts of a page that we include in in pages.

`_layouts`
  : More Jekyll stuff.

`_plugins`
  : Even more Jekyll stuff. 

`assets`
  : Standard Web site assets (e.g., CSS, JavaScript)

### Other

`bin` 
  : The various commands you can run

