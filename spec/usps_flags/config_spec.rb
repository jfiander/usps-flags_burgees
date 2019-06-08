# frozen_string_literal: true

require 'spec_helper'

describe USPSFlags::Config do
  describe 'general configuration' do
    it 'correctlies set the burgees_dir in USPSFlags::Config' do
      expect(USPSFlags.configuration.burgees_dir).to eql($tmp_burgees_dir)
    end
  end

  describe 'Rails configuration' do
    before do
      class Rails
        def self.root
          'tmp/rails_app'
        end
      end

      @config = described_class.new
    end

    it 'uses the default Rails log directory' do
      expect(@config.burgees_dir).to eql('tmp/rails_app/app/lib/usps-burgees')
    end
  end
end
