# frozen_string_literal: true

require 'usps_flags'
require 'usps_flags/burgees/config'
require 'usps_flags/burgees/errors'

# Main class for generating burgees.
class USPSFlags
  class Burgees
    require 'usps_flags/burgees/builtins'
    require 'usps_flags/burgees/customs'
    require 'usps_flags/burgees/crossed'

    # List of available burgees.
    def self.available
      (USPSFlags::Burgees::Builtins.available + USPSFlags::Burgees::Customs.available).uniq
    end

    # Constructor for generating burgees.
    #
    # @example Generate Birmingham's burgee
    #  burgee = USPSFlags::Burgee.new do |b|
    #    b.type = :birmingham
    #    b.outfile = "/path/to/svg/output.svg"
    #  end
    #
    #  burgee.svg #=> Generates SVG file at "/path/to/svg/output.svg"
    def initialize(options = {})
      @squadron = options[:squadron]
      @outfile = options[:outfile]
      # @width = 3000
      # @height = 2000
      @title = options[:title]
      @generated_at = Time.now.strftime('%Y%m%d.%H%S%z')
      yield self if block_given?
      @title ||= format_title(@squadron)
    end

    attr_accessor :squadron
    attr_accessor :outfile
    # attr_accessor :width
    # attr_accessor :height
    attr_accessor :title

    # Generates the constructed file as SVG.
    #
    # @params crossed Returns the burgee crossed-staves with the Ensign.
    # @return [String] Returns the SVG file output path, or the svg data if no path was specified.
    def svg(crossed: false)
      raise USPSFlags::Errors::UnknownBurgee unless USPSFlags::Burgees.available.include?(@squadron)

      burgee = crossed ? crossed(@squadron) : core(@squadron)
      header_opts = crossed ? { width: 1200, height: 600, scale: 7.25 } : {}

      @svg = <<~SVG
        #{USPSFlags::Core.headers(header_opts.merge(title: @title))}
        #{burgee}
        #{USPSFlags::Core.footer}
      SVG

      USPSFlags::Helpers.output(@svg, outfile: @outfile)
    end

  private

    def core(burgee)
      if custom?(burgee)
        USPSFlags::Burgees::Customs.get(burgee)
      elsif builtin?(burgee)
        USPSFlags::Burgees::Builtins.get(burgee)
      end
    end

    def crossed(burgee)
      USPSFlags::Burgees::Crossed.generate(core(burgee))
    end

    def custom?(burgee)
      USPSFlags::Burgees::Customs.available.include?(burgee)
    end

    def builtin?(burgee)
      USPSFlags::Burgees::Builtins.available.include?(burgee)
    end

    def format_title(burgee)
      burgee_string = burgee.to_s
      if burgee_string.match?(/_/)
        burgee_string.gsub('_', ' ').split(' ').map(&:capitalize).join(' ') + ' Burgee'
      else
        "#{burgee_string.capitalize} Burgee"
      end
    end
  end
end
