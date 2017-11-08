# Custom errors.
#
# @private
module USPSFlags::Errors
  class USPSFlags::Errors::UnknownBurgee < StandardError
    def initialize(msg = "You have requested an unknown burgee.")
      super(msg)
    end
  end
end
