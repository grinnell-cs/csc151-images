source "https://rubygems.org"

# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!
# gem "jekyll", "~> 3.8.3"
# 3.8.5 is bonked in a way that affects me https://github.com/jekyll/jekyll/issues/7380.
# ... but 4.0 seems to have fixed it!
# There also appears to be an issue with 4.2 that 4.3.3 fixes. Bleh.
#  https://www.reddit.com/r/Jekyll/comments/18sdsh4/noob_question_on_updated_static_website_generator/

gem "jekyll", "~> 4.3.3"

# A few gems that will be removed from core Ruby as of 3.4.0
gem "csv"               # Used by Jekyll
gem "base64"            # Used by safe_yaml
gem "bigdecimal"        # Used by liquid

# This is the default theme for new Jekyll sites. You may change this to anything you like.
gem "minima", "~> 2.0"

# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
# gem "github-pages", group: :jekyll_plugins

# If you have any plugins, put them here!
group :jekyll_plugins do
  gem "jekyll-bootstrap-sass"#, "~> 0.1.0"
  gem "jekyll-include-cache"#, "~> 0.1.0"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.0" if Gem.win_platform?

# Ruby 3.0 + Jekyll may require Webrick
gem "webrick"

