# frozen_string_literal: true

# Custom errors.
#
# @private
class USPSFlags
  class Errors
    class UnknownBurgee < StandardError
      def initialize(msg = 'You have requested an unknown burgee.')
        super(msg)
      end
    end
  end
end
