require './lib/software_version/version'
require 'benchmark'

FIXTURES_FILES_PATH = './spec/fixtures/*'.freeze

def compare_versions(versions)
  versions.each_index do |k|
    next if versions[k + 1].nil? || versions[k + 1] == ''
    a = SoftwareVersion::Version.new(versions[k])
    b = SoftwareVersion::Version.new(versions[k + 1])
    a < b
  end
end

versions = []

Dir[FIXTURES_FILES_PATH].each do |file_path|
  next unless File.file? file_path

  versions += File.read(file_path).split("\n")
end

Benchmark.bm do |benchmark|
  benchmark.report do
    20.times do
      compare_versions(versions)
    end
  end
end
