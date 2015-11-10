require 'irb/completion'

# http://blog.nicksieger.com/articles/2006/04/23/tweaking-irb/
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

# http://ruby-doc.org/stdlib-2.0.0/libdoc/irb/rdoc/IRB.html
IRB.conf[:AUTO_INDENT] = true
