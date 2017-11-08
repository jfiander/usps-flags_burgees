# Helper class for handling user-provided burgees.
#
# @private
class USPSFlags::Burgees::Customs
  def self.available
    Dir.glob("#{USPSFlags::Config.burgees_dir}/**/*.svg").map do |b|
      b.split("/").last.split(".svg").first.to_sym
    end
  end

  def self.get(burgee)
    raise USPSFlags::Errors::UnknownBurgee unless self.available.include?(burgee)
    ::File.read("lib/usps_flags/burgees/customs/#{burgee}.svg")
  end
end
