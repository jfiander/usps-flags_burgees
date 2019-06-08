# frozen_string_literal: true

# Helper class for handling user-provided burgees.
#
# @private
class USPSFlags
  class Burgees
    class Customs
      def self.available
        Dir.glob("#{USPSFlags.configuration.burgees_dir}/**/*.svg").map do |b|
          b.split('/').last.split('.svg').first.to_sym
        end
      end

      def self.get(burgee)
        raise USPSFlags::Errors::UnknownBurgee unless available.include?(burgee)

        ::File.read("#{USPSFlags.configuration.burgees_dir}/#{burgee}.svg")
      end
    end
  end
end
