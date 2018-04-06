#!/usr/bin/env ruby

array = File.readlines("../spec/fixtures/deb_version.txt").map(&:strip).sample(1000).sort { |a,b|
  cmd1 = "dpkg --compare-versions #{a} gt #{b}; echo $?"
  pos = %x[ #{cmd1} ].to_i
  cmd2 = "dpkg --compare-versions #{a} lt #{b}; echo $?"
  neg = %x[ #{cmd2} ].to_i

  if neg == 0
    -1
  elsif pos == 0
    1
  else
    0
  end
}

File.open("../spec/fixtures/deb_version_sort.txt", "w+") do |f|
  f.puts(array)
end