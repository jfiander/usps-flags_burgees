class USPSFlags::Burgees::Builtins
  def self.available
    Dir.glob("lib/usps_flags/burgees/builtins/**/*.rb").map do |b|
      b.split("/").last.split(".rb").first.to_sym
    end
  end

  def self.load(burgee)
    #
  end
end
