Instructor Notes for CSC151
===========================

We use a combination of GitHub/git, Jekyll, and Bookstrap to manage
the CSC-151 site.  This file provides some basic guidance about how
everything is managed.

Setting up
----------

Download from GitHub.  Here's a typical command.

    git clone git@github.com:grinnell-cs/csc151-images.git 

Make sure you have Ruby and Bundler installed on your machine.  On the
Mac, I tend to use Homebrew to get the latest versions installed.  I
believe we have them installed in MathLAN.

    brew install ruby
    gem install bundler

Normally, once you have downloaded the repo, you should have a `Gemfile`,
but not a `Gemfile.lock`.  If you have `Gemfile.lock`, remove it.

Next, run `bundle install`.  This should install Jekyll and other tools

    bundle install

you'll need to build the site.

Check to see that the site is available with `tasks/serve` (see below
for more details).

Check which branches are available.  If there's already one for your
course, use it.  If there's not one for your course, create it.

Try the server.

Edit the various files (see below).

Try the server.

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

There may be situations in which you decide to edit any file.  But these
are some of the files that are most frequently edited.

### Branch-specific

`_config.yml`
  : General site configuration.  Instructor, class hours, things like that.

`tasks/deploy`
  : Instructions for deploying to your Web server

`pages/syllabus.md`
  : The course syllabus/front door.

### Common (updated each semester)

Usually, one person updates all of these.

`_data/dates.yml`
  : The dates for the semester.  

`data/classes.yml`
  : The list of class topics, in order.

`data/extra.yml`
  : Due dates and some other extra information.

`data/weeks.yml`
  : Titles of individual weeks.

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

    bin - The various commands you can run

    _data - Information about the class, including due dates

    _eboards - Live notes, used mostly in SamR's sections.

