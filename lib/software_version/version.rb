module SoftwareVersion
  class Version
    include Comparable

    attr_reader :v
    attr_reader :sv

    def initialize(version)
      @v = version.to_s
      @sv = @v.gsub(/el[5-7](?:_[0-9])?/, '').scan(/(?:[0-9]+|[A-Za-z]+)/)
    end

    def <=>(other)
      # Split each sub part
      @sv.each_with_index do |s, index|
        # brek if the size of the array mismatch
        break if other.sv.size <= index

        # check if the subpart is numeric
        if numeric?(s) && numeric?(other.sv[index])
          return s.to_f <=> other.sv[index].to_f if (s.to_f <=> other.sv[index].to_f).nonzero?
        end

        return s <=> other.sv[index] if (s <=> other.sv[index]).nonzero?
      end

      # if the two part are equals, check the size of the vector
      return 1 if other.sv.size < @sv.size
      return -1 if other.sv.size > @sv.size

      return @v <=> other.v if (@v <=> other.v).nonzero?
      0
    end

    def to_s
      @v
    end

    def to_str
      to_s
    end

    private

    def numeric?(obj)
      true if Float(obj)
    rescue StandardError
      false
    end
  end
end
