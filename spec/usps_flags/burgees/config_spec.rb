require 'spec_helper'

describe USPSFlags::Config do
  before(:each) do
    @config = USPSFlags::Config.new do |c|
      c.burgees_dir = "path/to/burgees"
    end
  end

  it "should correctly set the burgees_dir in USPSFlags::Config" do
    expect(USPSFlags::Config.burgees_dir).to eql("path/to/burgees")
  end
end
