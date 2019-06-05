# frozen_string_literal: true

# Helper class for handling built-in burgees.
#
# @private
class USPSFlags::Burgees::Builtins
  @@builtins_dir = "#{File.expand_path(File.dirname(__FILE__))}/builtins"

  def self.available
    Dir.glob("#{@@builtins_dir}/**/*.svg").map { |b|
      b.split('/').last.split('.svg').first
    }.map(&:to_sym)
  end

  def self.get(burgee)
    raise USPSFlags::Errors::UnknownBurgee "Looked in #{@@builtins_dir}" unless self.available.include?(burgee)

    ::File.read("#{@@builtins_dir}/#{burgee}.svg")
  end
end
