# frozen_string_literal: true

# Extension of USPSFlags::Config to allow including custom burgee files.
#
# @private
class USPSFlags
  class Config
    attr_writer :burgees_dir

    def initialize
      get_defaults
      burgees_dir
      yield self if block_given?
    end

    def burgees_dir
      @burgees_dir ||= if defined?(::Rails)
        "#{::Rails.root}/app/lib/usps-burgees"
      else
        "#{File.dirname(__dir__)}/output"
      end
    end
  end
end
