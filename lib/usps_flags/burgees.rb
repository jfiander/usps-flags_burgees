class USPSFlags::Burgees
  require 'usps_flags/config'
  require 'usps_flags/burgees/builtins'
  require 'usps_flags/burgees/customs'

  def available
    Dir.glob('lib/usps_flags/burgees/builtins/**/*.rb').map do |b|
      b.split("/").last.split(/\.rb$/).first.to_sym
    end
  end
end
