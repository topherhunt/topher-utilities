# PO file machine translation script
# See https://cloud.google.com/translate/docs/quickstart-v3
#
# Usage:
# - Make sure you have a Google Cloud project set up
# - Make sure Google Cloud SDK is installed & configured) (to test: `gcloud config list`)
# - Make sure that CREDENTIALS_PATH points to your default project's credentials json file
# - cd to the directory containing the .po file
# - `ruby ~/path/to/machine_translate.rb my_po_file.po en nl`
# - The script will modify the po file in-place. Use Git! Have backups! Save the animals!
#
# Possible improvements:
# - Google Cloud Translate messes up each injection. But I notice in leaves html tags alone. Maybe the injections can be rewritten as html tags, then reverted after translation? In the meantime you need to manually check over and fix each injection (search for "%{" in the msgid and double-check the corresponding msgstr).
# - Gettext notates msgstr for singular & plural versions with a [0] and [1]. I'm unclear whether these could appear in the wrong order, or if there could be a [2] etc. The script will fail at those hypothetical scenarios currently.
#

require 'uri'
require 'net/http'
require 'net/https'
require 'json'

#
# Setup
#

CREDENTIALS_PATH = ENV["GOOGLE_APPLICATION_CREDENTIALS"] || "~/.ssh/google_application_credentials.json"
@po_filename = ARGV[0]
@source_locale = ARGV[1]
@target_locale = ARGV[2]

puts "Getting gcloud project id..."
match = `gcloud config list`.match(/project = ([\w\-]+)/)
raise "No gcloud project configured!" unless match
@project_id = match[1]
puts "Using gcloud project id: #{@project_id}"

puts "Getting gcloud auth token..."
@gcloud_token = `GOOGLE_APPLICATION_CREDENTIALS=#{CREDENTIALS_PATH} gcloud auth application-default print-access-token`.strip()

@chars_translated = 0

#
# Functions
#

def main
  buffer = []
  last_msgid_singular = ""
  last_msgid_plural = ""
  IO.foreach(@po_filename) do |line|
    line = line.strip
    if line.match(/\A[(#|"Language|"Plural)]/) || line == ""
      buffer << line
    elsif match = line.match(/\Amsgid "(.*)"\z/)
      last_msgid_singular = match[1]
      buffer << line
    elsif match = line.match(/\Amsgid_plural "(.*)"\z/)
      last_msgid_plural = match[1]
      buffer << line
    elsif line == "msgstr \"\"" || line == "msgstr[0] \"\""
      translation = translate(last_msgid_singular)
      line = "msgstr \"#{translation}\""
      buffer << line
    elsif line == "msgstr \"\"" || line == "msgstr[1] \"\""
      translation = translate(last_msgid_plural)
      line = "msgstr \"#{translation}\""
      buffer << line
    elsif line.match(/msgstr(\[\d\])? ".+"/)
      buffer << line
    else
      raise "Unrecognized line format: #{line.inspect}"
    end

    puts "|<<<>>>| #{line}"
  end

  puts "Saving file."
  IO.write(@po_filename, buffer.join("\n") + "\n")

  puts "\nDone! Notes:\n"
  puts "  * You just translated #{@chars_translated} chars using Google Cloud Translation. See https://cloud.google.com/translate/pricing."
  puts "  * Manually review all these translations, especially any injected vars."
end

def translate(string)
  return "" if string == ""
  @chars_translated += string.length

  data = {
    "source_language_code" => @source_locale,
    "target_language_code" => @target_locale,
    "contents" => [string]
  }

  domain = "https://translation.googleapis.com"
  uri = URI.parse("#{domain}/v3beta1/projects/#{@project_id}/locations/global:translateText")
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  headers = {"Content-Type" =>"application/json", "Authorization" => "Bearer #{@gcloud_token}"}
  req = Net::HTTP::Post.new(uri.path, initheader = headers)
  req.body = data.to_json
  res = https.request(req)
  # puts "DEBUG | Response #{res.code} #{res.message}: #{res.body}"
  json = JSON.parse(res.body)
  json.fetch('translations').first().fetch('translatedText')
end

#
# Run it
#

# translation = translate("Hello world from outer space!")
# puts "The translation is: \"#{translation}\""

main()
