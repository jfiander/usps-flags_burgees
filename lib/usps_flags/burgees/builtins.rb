class USPSFlags::Burgees::Builtins
  def self.available
    Dir.glob("lib/usps_flags/burgees/builtins/**/*.svg").map { |b|
      b.split("/").last.split(".svg").first
    }.map(&:to_sym)
  end

  def self.get(burgee)
    raise USPSFlags::Errors::UnknownBurgee unless self.available.include?(burgee)
    ::File.read("lib/usps_flags/burgees/builtins/#{burgee}.svg")
  end
end
