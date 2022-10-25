# Usage:
# - cd to your repo folder
# - ensure you're on the branch that you want to evaluate (usually master)
# - ruby ~/Sites/personal/utilities/hoc.rb "Topher" 2020-12

# References:
# - http://dymitruk.com/blog/2012/07/18/filtering-by-author-name/

# List commits by this author, in this daterange, in compact format:
# git log --pretty=format:"%h %ai (%an) | %s" --shortstat --author="Topher" --since=2020-10-01 --until=2020-11-01

require 'date'

def abort(message)
  puts message
  exit
end

author = ARGV[0]
month = ARGV[1]

USAGE_INSTRUCTIONS = %s[Usage: \n  ruby ~/Sites/personal/utilities/hoc.rb "Topher" 2020-12]
abort(USAGE_INSTRUCTIONS) if author.to_s == ""
abort(USAGE_INSTRUCTIONS) unless month =~ /^\d{4}-\d\d$/

sdate = Date.parse("#{month}-01")
edate = sdate.next_month # exclusive this date itself
flags = "--shortstat --author=\"#{author}\" --since=#{sdate} --until=#{edate}"

puts "Command:       git log --pretty=tformat:\"\" #{flags}"
puts "Full details:  git log --pretty=format:\"%h %ai (%an) | %s\" #{flags}"
puts

hoc = 0

`git log --pretty=tformat:\"\" #{flags}`
.split("\n")
.reject { |l| l.strip == "" }
.each do |line|
  if line =~ /^\s*(\d+) files? changed, ((\d+) [^\s\d]+, )?(\d+) [^\s\d]+$/
    files = $1.to_i
    ins = $3.to_i
    del = $4.to_i
    hoc += files + ins + del
    # puts " * #{files} files changed, #{ins} insertions, #{del} deletions" # for debugging
  else
    raise "unrecognized line format: \n#{line.inspect}"
  end
end

puts "Author: #{author.inspect}, month: #{month}, total HOC: #{hoc}"
