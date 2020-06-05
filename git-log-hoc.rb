# Parse and condense `git log` output to include the hash, date, author, message,
# and change statistics all on one line. Run the script with the following command
# (ie. alias this to `gl` or something short):
#   git log --pretty=format:"%h %ai (%an) | %s" --shortstat | ruby ~/path/to/git-log-hoc.rb | less -RS
#
# Sample output (real output is colorized so you can tell the stat numbers apart):
# df79691 2016-11-18 (Topher Hunt) | Add Category and its assoc. to Video  [14 111 21]
# 4f2bf68 2016-11-04 (Topher Hunt) | Video actions scoped to logged-in user  [3 27 15]
# d6d0ee6 2016-11-04 (Topher Hunt) | Reorganize & refactor auth for Videos  [8 64 32]
# 5733dc3 2016-11-03 (Topher Hunt) | Authenticate current user  [3 36]
# 5bad5aa 2016-11-03 (Topher Hunt) | User model: Validate & hash pw on create  [2 19 3]
# cfb9b18 2016-11-03 (Topher Hunt) | User#create: Handle validation errors  [2 20 8]
#
# Features:
# - Tolerates blank values (eg. merge commits where change stats aren't available)
# - Tolerates multiple authors (e.g. when using Pivotal's `git pair` script)
# - Tolerates accented chars in author names
# - Treats STDIN as a stream - doesn't block until STDIN finishes loading
# - Pretty colors - should be easy to customize & extend

# [1:hash] [2:date] [time] [timezone] [3:author name] | [4:commit message]
LINE1_REGEX = /(\w+) ([\d-]{10}) [\d:]{8} [\-\+]\d{4} (\([[:alpha:]\d\s\.&,]+\)) \| ([^\n]+)/
# [1: # files], [3: lines inserted], [5: lines deleted]
LINE2_REGEX = /(\d+) files? changed(, (\d+) insertions?...)?(, (\d+) deletions?...)?/

@buffer = ""

def main
  while line = $stdin.gets
    if match = line.match(LINE1_REGEX)
      print_and_empty_buffer
      @buffer << "#{colorize :cyan, match[1]} #{match[2]} #{match[3]} | #{match[4]}"
    elsif match = line.match(LINE2_REGEX)
      @buffer << "  [#{colorize :yellow, match[1]}"
      @buffer << " #{colorize :green, match[3]}" if match[3].present?
      @buffer << " #{colorize :red, match[5]}"   if match[5].present?
      @buffer << "]"
    elsif line.blank?
      next
    else
      puts "Unrecognized line format: #{line}"
    end
  end
  print_and_empty_buffer # Ensure the final entry is spit out too!
rescue Errno::EPIPE => e
  # This error likely means the git log was quit before reading & parsing completed.
  # That's an expected thing; just gracefully quit.
end

def colorize(color, text)
  # Thanks to https://kpumuk.info/ruby-on-rails/colorizing-console-ruby-script-output/
  color_codes = {
    red: 31,
    green: 32,
    yellow: 33,
    blue: 34,
    cyan: 36,
    default: 39 }
  "\e[#{color_codes.fetch(color)}m" + text + "\e[#{color_codes[:default]}m"
end

def print_and_empty_buffer
  if @buffer.present?
    puts @buffer
    @buffer = ""
  end
end

# Core extensions for present? and blank?

class String
  def blank? ; strip.length == 0 ; end
  def present? ; !blank? ; end
end

class NilClass
  def blank? ; true ; end
  def present? ; false ; end
end

main()

# The original (slower & more fragile) implementation:
# STDIN.read.gsub(/
    # (\w{7})\s # abbreviated hash
    # ([\d-]{10})\s # date
    # [\d:]{8}\s # time
    # -\d{4}\s # timezone
    # (\([\w\s]+\))\s # author name
    # \|\s # pipe before commit message
    # ([^\n]+)\n\s* # the message and end of 1st line
    # (\d+)\s files?\s changed # files changed
    # (,\s (\d+)\s insertions?...)? # insertions
    # (,\s (\d+)\s deletions?...)? # deletions
    # \n* # extra whitespace
#   /mx,
#   '\1 \2 \3 | \4  ' + "[#{colorize(:yellow, '\5')} #{colorize(:green, '\7')} #{colorize(:red, '\9')}]\n"
# )
