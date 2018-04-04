require 'spec_helper'

module SoftwareVersion
  describe Version do
    it 'check version 4' do
      a = Version.new('4.1.2-29.el6')
      b = Version.new('4.1.2-15.el6_5')
      expect(a > b).to be true
    end

    it 'check version 5' do
      a = Version.new('2014.1.98-65.1.el6')
      b = Version.new('2013.1.95-65.1.el6_5')
      expect(a > b).to be true
    end

    it 'check version 6' do
      a = Version.new('4.1.1-43.P1.el6.centos')
      b = Version.new('4.1.1-34.P1.el6')
      expect(a > b).to be true
    end

    it 'check version 7' do
      a = Version.new('2.6.32-504.el6')
      b = Version.new('2.6.32-504.12.2.el6')
      expect(a < b).to be true
    end

    it 'check version 8' do
      a = Version.new('5.3p1-104.el6')
      b = Version.new('5.3p1-94.el6')
      expect(a > b).to be true
    end

    it 'check version 9' do
      a = Version.new('7.19.7-37.el6_5.3')
      b = Version.new('7.19.7-37.el6_5')
      expect(a > b).to be true
    end

    it 'check version 10' do
      a = Version.new('4.1.1-43.P1.el6.centos')
      b = Version.new('4.1.1-43.P1.el6')
      expect(a > b).to be true
    end

    it 'check version 15' do
      a = Version.new('3.14.3-23.3.el6_8')
      b = Version.new('3.14.3-23.el6_7')
      expect(a > b).to be_truthy
    end

    it 'check equivalent between i686 et x86_64' do
      a = Version.new('9.3.6-25.P1.el5_11.5.i386')
      b = Version.new('9.3.6-25.P1.el5_11.5.x86_64')
      expect(a == b).to be false
    end

    it 'check equivalent between i686 et x86_64' do
      a = Version.new('3.19.1-2.el5_11.x86_64')
      b = Version.new('3.19.1-2.el5_11.i386')
      expect(a == b).to be false
    end

    it 'check equivalent between i686 et x86_64' do
      a = Version.new('3.19.1-2.el5_11.i686')
      b = Version.new('3.19.1-2.el5_11.i386')
      expect(a == b).to be false
    end
  end
end
