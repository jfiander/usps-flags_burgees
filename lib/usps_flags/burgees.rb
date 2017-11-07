require 'usps_flags'
require 'usps_flags/burgees/config'
require 'usps_flags/burgees/errors'

class USPSFlags::Burgees
  require 'usps_flags/burgees/builtins'
  require 'usps_flags/burgees/customs'

  class << self
    def available
      USPSFlags::Burgees::Builtins.available + USPSFlags::Burgees::Customs.available
    end

    def get(burgee, outfile: nil)
      raise USPSFlags::Errors::UnknownBurgee unless available.include?(burgee)

      # Configuration values may be editable
      @width = 3000
      @height = 2000
      @view_width = 3000
      @view_height = 2000
      @title = title(burgee)

      @generated_at = Time.now.strftime("%Y%m%d.%H%S%z")

      svg = <<~SVG
        #{USPSFlags::Core.headers}
        #{core(burgee)}
        #{USPSFlags::Core.footer}
      SVG

      USPSFlags::Helpers.output(svg, outfile: outfile)
    end

    private
    def core(burgee)
      if custom?(burgee)
        USPSFlags::Burgees::Customs.get(burgee)
      elsif builtin?(burgee)
        USPSFlags::Burgees::Builtins.get(burgee)
      end
    end

    def custom?(burgee)
      USPSFlags::Burgees::Customs.available.include?(burgee)
    end

    def builtin?(burgee)
      USPSFlags::Burgees::Builtins.available.include?(burgee)
    end

    def title(burgee)
      burgee_string = burgee.to_s
      burgee_title = if burgee.match /_/
        burgee_string.split("_").map { |word| word.capitalize } + " Burgee"
      else
        "#{burgee_string} Burgee"
      end
    end
  end
end
