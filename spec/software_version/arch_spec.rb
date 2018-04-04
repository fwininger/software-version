require 'spec_helper'

module SoftwareVersion
  describe Version do
    it 'checks arch packages version' do
      a = Version.new('2.0.0-1')
      b = Version.new('2.0.0+11+gec9ba8b-1')
      expect(b > a).to be_truthy
    end

    it 'checks arch packages version' do
      a = Version.new('3.1.3-1')
      b = Version.new('3.1.3pre1-1')
      expect(b > a).to be_truthy
    end
  end
end
