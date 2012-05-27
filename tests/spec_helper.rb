#require 'shoulda'

#Autotest.add_hook :initialize do |at|
#at.add_mapping(%r%^spec/(integration)/.*rb$%) { |filename, _|
#   filename
# }
#end


### The autotest command generates a shell command that runs your specs. If you are using Bundler, and you want the shell command to include bundle exec, require the Autotest bundler plugin in a .autotest file in the project's root directory or your home directory:

## in .autotest
#require "autotest/bundler"



#spec_helper.rb

RSpec.configure do |config|
  config.color_enabled = true
end

#You then must require in each *_spec.rb file that should use that option.


#RSpec.configure do |config|
#  # Use color in STDOUT
#  config.color_enabled = true

#  # Use color not only in STDOUT but also in pagers and files
#  config.tty = true

#  # Use the specified formatter
#  config.formatter = :documentation # :progress, :html, :textmate
#end

#.autotest
