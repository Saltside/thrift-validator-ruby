require 'bundler/setup'

root = File.expand_path '../..', __FILE__

$LOAD_PATH << "#{root}/vendor/gen-rb"

require 'thrift-validator'

Thrift.type_checking = true

require 'test_types'
require 'minitest/autorun'
