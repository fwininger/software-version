require 'software_version'

def fixture(path)
  File.open(File.dirname(__FILE__) + '/fixtures/' + path).read
end
