class USPSFlags::Burgees::Customs
  def self.available
    Dir.glob("#{USPSFlags::Config.burgees_dir}/**/*.svg").map do |b|
      b.split("/").last.split(".svg").first.to_sym
    end
  end

  def self.load(burgee)
    #
  end
end
