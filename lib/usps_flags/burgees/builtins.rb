class USPSFlags::Burgees::Builtins
  def self.available
    Dir.glob("lib/usps_flags/burgees/builtins/**/*.svg").map { |b|
      b.split("/").last.split(".svg").first
    }.map(&:to_sym)
  end

  def self.load(burgee)
    #
  end
end
