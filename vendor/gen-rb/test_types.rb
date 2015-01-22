#
# Autogenerated by Thrift Compiler (0.9.2)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

class SimpleStruct
  include ::Thrift::Struct, ::Thrift::Struct_Union
  REQUIRED_STRING = 1
  OPTIONAL_STRING = 2

  FIELDS = {
    REQUIRED_STRING => {:type => ::Thrift::Types::STRING, :name => 'required_string'},
    OPTIONAL_STRING => {:type => ::Thrift::Types::STRING, :name => 'optional_string', :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field required_string is unset!') unless @required_string
  end

  ::Thrift::Struct.generate_accessors self
end

class NestedExample
  include ::Thrift::Struct, ::Thrift::Struct_Union
  REQUIRED_STRUCT = 1
  OPTIONAL_STRUCT = 2

  FIELDS = {
    REQUIRED_STRUCT => {:type => ::Thrift::Types::STRUCT, :name => 'required_struct', :class => ::SimpleStruct},
    OPTIONAL_STRUCT => {:type => ::Thrift::Types::STRUCT, :name => 'optional_struct', :class => ::SimpleStruct, :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field required_struct is unset!') unless @required_struct
  end

  ::Thrift::Struct.generate_accessors self
end

class ListExample
  include ::Thrift::Struct, ::Thrift::Struct_Union
  REQUIRED_LIST = 1
  OPTIONAL_LIST = 2

  FIELDS = {
    REQUIRED_LIST => {:type => ::Thrift::Types::LIST, :name => 'required_list', :element => {:type => ::Thrift::Types::STRUCT, :class => ::SimpleStruct}},
    OPTIONAL_LIST => {:type => ::Thrift::Types::LIST, :name => 'optional_list', :element => {:type => ::Thrift::Types::STRUCT, :class => ::SimpleStruct}, :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field required_list is unset!') unless @required_list
  end

  ::Thrift::Struct.generate_accessors self
end

class StringListExample
  include ::Thrift::Struct, ::Thrift::Struct_Union
  REQUIRED_LIST = 1

  FIELDS = {
    REQUIRED_LIST => {:type => ::Thrift::Types::LIST, :name => 'required_list', :element => {:type => ::Thrift::Types::STRING}}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field required_list is unset!') unless @required_list
  end

  ::Thrift::Struct.generate_accessors self
end

class StringSetExample
  include ::Thrift::Struct, ::Thrift::Struct_Union
  REQUIRED_SET = 1

  FIELDS = {
    REQUIRED_SET => {:type => ::Thrift::Types::SET, :name => 'required_set', :element => {:type => ::Thrift::Types::STRING}}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field required_set is unset!') unless @required_set
  end

  ::Thrift::Struct.generate_accessors self
end

class SetExample
  include ::Thrift::Struct, ::Thrift::Struct_Union
  REQUIRED_SET = 1
  OPTIONAL_SET = 2

  FIELDS = {
    REQUIRED_SET => {:type => ::Thrift::Types::SET, :name => 'required_set', :element => {:type => ::Thrift::Types::STRUCT, :class => ::SimpleStruct}},
    OPTIONAL_SET => {:type => ::Thrift::Types::SET, :name => 'optional_set', :element => {:type => ::Thrift::Types::STRUCT, :class => ::SimpleStruct}, :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field required_set is unset!') unless @required_set
  end

  ::Thrift::Struct.generate_accessors self
end

class MapKeyExample
  include ::Thrift::Struct, ::Thrift::Struct_Union
  REQUIRED_MAP = 1
  OPTIONAL_MAP = 2

  FIELDS = {
    REQUIRED_MAP => {:type => ::Thrift::Types::MAP, :name => 'required_map', :key => {:type => ::Thrift::Types::STRUCT, :class => ::SimpleStruct}, :value => {:type => ::Thrift::Types::STRING}},
    OPTIONAL_MAP => {:type => ::Thrift::Types::MAP, :name => 'optional_map', :key => {:type => ::Thrift::Types::STRUCT, :class => ::SimpleStruct}, :value => {:type => ::Thrift::Types::STRING}, :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field required_map is unset!') unless @required_map
  end

  ::Thrift::Struct.generate_accessors self
end

class MapValueExample
  include ::Thrift::Struct, ::Thrift::Struct_Union
  REQUIRED_MAP = 1
  OPTIONAL_MAP = 2

  FIELDS = {
    REQUIRED_MAP => {:type => ::Thrift::Types::MAP, :name => 'required_map', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRUCT, :class => ::SimpleStruct}},
    OPTIONAL_MAP => {:type => ::Thrift::Types::MAP, :name => 'optional_map', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRUCT, :class => ::SimpleStruct}, :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field required_map is unset!') unless @required_map
  end

  ::Thrift::Struct.generate_accessors self
end

