# Usage:
# - Quit Swinsian
# - `open "~/Library/Application Support/Swinsian/"`
# - Open Library.sqlite in SQLite Browser
# - Run query: `SELECT track_id, title, artist, album, path, filename, lastplayed FROM track;`
# - Select all and save to a .tsv file
# - `ruby ~/Sites/personal/utilities/check-filename-validity.rb path/to/my/file.tsv`

require 'csv'
require 'stringio'
require 'time'

unless ARGV[0].include?(".tsv")
  puts "Usage:\n  ruby ~/Sites/personal/utilities/check-filename-validity.rb path/to/my/file.tsv\n"
  exit
end

tsv_file_path = ARGV[0]
file_content = File.read(tsv_file_path).gsub('"', '')
io = StringIO.new(file_content)

puts "Missing songs:"

CSV.new(io, col_sep: "\t", headers: true).each do |row|
  file_path = row['path']

  unless File.exist?(file_path)
    puts "  * \"#{row["path"]}\"     (#{row["title"]} / #{row["artist"]} / #{row["album"]})"
  end
end
