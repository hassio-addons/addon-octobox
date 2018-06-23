ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# Disabled because of the following bug:
# https://bugs.ruby-lang.org/issues/13670
# require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
