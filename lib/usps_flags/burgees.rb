require 'usps_flags'
require 'usps_flags/burgees/config'
require 'usps_flags/burgees/errors'

class USPSFlags::Burgees
  require 'usps_flags/burgees/builtins'
  require 'usps_flags/burgees/customs'

  def available
    USPSFlags::Burgees::Builtins.available + USPSFlags::Burgees::Customs.available
  end
end
