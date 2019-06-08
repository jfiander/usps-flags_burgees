# frozen_string_literal: true

# Helper class for handling built-in burgees.
#
# @private
class USPSFlags
  class Burgees
    class Builtins
      @builtins_dir = "#{__dir__}/builtins"

      def self.available
        Dir.glob("#{@builtins_dir}/**/*.svg").map do |b|
          b.split('/').last.split('.svg').first
        end.map(&:to_sym)
      end

      def self.get(burgee)
        raise USPSFlags::Errors::UnknownBurgee "Looked in #{@builtins_dir}" unless available.include?(burgee)

        ::File.read("#{@builtins_dir}/#{burgee}.svg")
      end
    end
  end
end
