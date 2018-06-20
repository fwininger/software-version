module SoftwareVersion
  class Version
    include Comparable

    attr_reader :v
    attr_reader :sv

    def initialize(version)
      @v = version.to_s
      @sv = @v.gsub(/el[5-7](?:_[0-9])?/, '').scan(/[^-^+^~]+/).map { |x| x.scan(/(?:[0-9]+|[A-Za-z]+)/) }
    end

    def <=>(other)

      @sv.each_index do |k|
        if (res = sub_compare(other, k)).nonzero?
          return res
        end
      end

      return @v <=> other.v if (@v <=> other.v).nonzero?
      0
    end

    def to_s
      @v
    end

    def to_str
      to_s
    end

    def major
      return nil if @sv.empty? || @sv[0].empty?
      @sv[0][0]
    end

    def minor
      return nil if @sv.empty? || @sv[0].empty?
      @sv[0][1]
    end

    def patch
      return nil if @sv.empty? || @sv[0].empty?
      @sv[0][2]
    end


    private

    def sub_compare(other, k = 0)
      # Split each sub part
      @sv[k].each_with_index do |s, index|
        # brek if the size of the array mismatch
        break if other.sv[k].nil? || other.sv[k].size <= index

        # check if the subpart is numeric
        if numeric?(s) && numeric?(other.sv[k][index])
          if (s.to_f <=> other.sv[k][index].to_f).nonzero?
            return s.to_f <=> other.sv[k][index].to_f
          else
            next
          end
        end

        return s <=> other.sv[k][index] if (s <=> other.sv[k][index]).nonzero?
      end

      # if the two part are equals, check the size of the vector
      return 1 if other.sv[k].nil? || other.sv[k].size < @sv[k].size
      return -1 if other.sv[k].size > @sv[k].size
      0
    end

    def numeric?(obj)
      true if Float(obj)
    rescue StandardError
      false
    end
  end
end
