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

    context "Sort file test" do
      before(:all) do
        @version_array = fixture("pacman_version_sort.txt").split("\n")
      end

      @version_array = fixture("pacman_version_sort.txt").split("\n")
      @version_array.each_index do |k|
        it "compare #{@version_array[k]} < #{@version_array[k+1]}" do
          next if @version_array[k+1].nil? || @version_array[k+1] == ""
          a = Version.new(@version_array[k])
          b = Version.new(@version_array[k+1])
          expect(a <= b).to be true
        end
      end
    end
  end
end
