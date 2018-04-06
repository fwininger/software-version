require 'spec_helper'

module SoftwareVersion
  describe Version do
    context "Sort file test" do
      before(:all) do
        @version_array = fixture("windows_application_version_sort.txt").split("\n")
      end

      @version_array = fixture("windows_application_version_sort.txt").split("\n")
      @version_array.each_index do |k|
        it "compare #{@version_array[k]} < #{@version_array[k+1]}" do
          next if @version_array[k+1].nil? || @version_array[k+1] == ""
          a = Version.new(@version_array[k])
          b = Version.new(@version_array[k+1])
          expect(a < b).to be true
        end
      end
    end
  end
end
