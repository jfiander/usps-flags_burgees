require 'spec_helper'

describe USPSFlags::Config do
  describe "general configuration" do
    before(:each) do
      @config = USPSFlags::Config.new do |c|
        c.burgees_dir = "tmp/path/to/burgees"
      end
    end

    it "should correctly set the burgees_dir in USPSFlags::Config" do
      expect(USPSFlags::Config.burgees_dir).to eql("tmp/path/to/burgees")
    end
  end

  describe "Rails configuration" do
    before(:each) do
      class Rails
        def self.root
          "tmp/rails_app"
        end
      end
    end

    it "should use the default Rails log directory" do
      expect(USPSFlags::Config.burgees_dir).to eql("tmp/rails_app/app/lib/usps-burgees")
    end
  end
end
