class USPSFlags::Burgees::Customs
  def self.available
    Dir.glob("#{USPSFlags::Config.burgees_dir}/**/*.rb").map do |b|
      b.split("/").last.split(".rb").first.to_sym
    end
  end

  def self.load
    #
  end
end
