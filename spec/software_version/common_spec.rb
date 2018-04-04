require 'spec_helper'

module SoftwareVersion
  describe Version, type: :model do
    before :all do
      @v1 = Version.new('1.0.0')
      @v2 = Version.new('1.5.5')
      @v3 = Version.new('1.4.8')
      @v4 = Version.new('1.10.5')
      @v5 = Version.new('1.10')
    end

    it 'check version 1' do
      # 1.0.0 < 1.5.5
      expect(@v1 < @v2).to be true
      # 1.5.5 > 1.4.8
      expect(@v2 > @v3).to be true
      # 1.0.0 < 1.10.5
      expect(@v1 < @v4).to be true
      # 1.0.0 < 1.10
      expect(@v1 < @v5).to be true
    end

    it 'check version 2' do
      # 1.5.5 < 1.10.5
      expect(@v2 < @v4).to be true
      # 1.4.8 < 1.10.5
      expect(@v3 < @v4).to be true
      # 1.10 < 1.10.5
      expect(@v5 < @v4).to be true
    end

    it 'check sorting' do
      list = [@v1, @v2, @v3, @v4, @v5]
      list.sort!
      expect(list).to eq [@v1, @v3, @v2, @v5, @v4]
    end
  end
end
