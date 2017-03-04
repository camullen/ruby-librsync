require 'optparse'
require 'set'

# UpdateOpts = Struct.new(:link, :name, :priority, :version_suffix)
UpdateOpts = Struct.new(:name, :version)
update_opts = UpdateOpts.new

opt_parse = OptionParser.new do |opts|
  opts.banner = <<~HEREDOC
    Usage: update_dependent_alternatives.rb [options] [packages]
    (See man update-alternatives for details on parameters and system)
  HEREDOC

  opts.separator ""
  opts.separator "Options:"

  opts.on(
    '-n',
    '--name NAME',
    String,
    'The generic name for the master link. (e.g. `gcc`)'
  ) { |name| update_opts.name = name }

  # opts.separator ""

  # opts.on(
  #   '-l',
  #   '--link LINK',
  #   String,
  #   'A link, like /usr/bin/gcc, which refers, via the alternatives',
  #   'system, to one of a number of files of similar function'
  # ) { |link| update_opts.link = link }

  # opts.separator ""

  # opts.on(
  #   '-p',
  #   '--priority PRIORITY',
  #   Integer,
  #   'The priority of the alternatives group. Higher priorities take',
  #   'precedence if no alternative is manually selected'
  # ) { |priority| update_opts.priority = priority }

  opts.separator ""

  opts.on(
    '-v',
    '--version VERSION',
    String,
    'The version appended to the versioned links installed by the',
    'debian packages. (e.g. `5` for gcc-5 package which installs',
    '/usr/bin/gcc-5 link'
  ) { |version| update_opts.version = version }

  opts.separator ""

  opts.on('-h', '--help', 'Prints this help') do
    puts opts
    exit
  end

  opts.separator ""
end

begin
  opt_parse.parse!(ARGV)
  packages = ARGV.map(&:strip).reject(&:empty?)
  mandatory = [:name, :version]
  missing = mandatory.select{ |param| update_opts[param].nil? }
  raise OptionParser::MissingArgument.new(missing.join(', ')) unless missing.empty?
  raise 'No packages given' if packages.empty?
rescue OptionParser::InvalidOption, OptionParser::MissingArgument, RuntimeError => e
  puts e.message
  puts opt_parse
  exit
end

puts "Update Options: #{update_opts}"
puts "Packages: #{packages}"

bin_files = Set.new(`ls -1A /usr/bin/*`.split(' '))
package_files = Set.new(packages.map { |pkg| `dpkg-query -L #{pkg}`.split(' ') }.flatten)
