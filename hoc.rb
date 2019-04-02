FILTERS=["Topher"]

def run(cmd)
  puts "CMD: #{cmd}"
  `#{cmd}`.split("\n")
end

list_commits_cmd = "git log --pretty=format:\"%h %ai (%an) | %s\""
FILTERS.each { |f| list_commits_cmd += " | grep \"#{f}\"" }
all_commit_lines = run(list_commits_cmd)
all_commits = all_commit_lines.map { |l| l.match(/\A(\w+) /).captures.first }
puts "All commits: #{all_commits}"



`git log 828ada754^1..828ada754 --shortstat`



# The hoc gem version:
# (I can cobble this command together pretty easily and modify it to specify
# starting & ending commits)

def hits
  version = `git --version`.split(/ /)[2]
  raise "git version #{version} is too old, upgrade it to 2.0+" unless
    Gem::Version.new(version) >= Gem::Version.new('2.0')
  cmd = [
    "cd #{@dir} && git",
    # 'log 461c3dbbd..HEAD' to provide a starting commit
    'log 461c3dbbd..HEAD', '--pretty=tformat:', '--numstat',
    '--ignore-space-change', '--ignore-all-space',
    '--ignore-submodules', '--no-color',
    '--find-copies-harder', '-M', '--diff-filter=ACDM',
    "'--author=#{@author}'", '--', '.',
    @exclude.map { |e| "':(exclude,glob)#{e}'" }.join(' ')
  ].join(' ')
  [
    Hits.new(
      Time.now,
      `#{cmd}`.split(/\n/).delete_if(&:empty?).map do |t|
        t.split(/\t/).take(2).map(&:to_i).inject(:+)
      end.inject(:+) || 0
    )
  ]
end
