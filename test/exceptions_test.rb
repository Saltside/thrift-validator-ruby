require_relative 'test_helper'

class ExceptionsTest < MiniTest::Unit::TestCase
  def test_exception_message_contains_class_name
    # The error is in NestedExample - required_struct is unset
    struct = NestedExample.new required_struct: nil

    ex = assert_raises Thrift::ProtocolException do
      Thrift::Validator.new.validate(struct)
    end
    assert_match /NestedExample/, ex.message
  end

  def test_exception_message_contains_nested_class_name
    # Here NestedExample is valid, but the error is one level down
    # in SimpleStruct (its required_string is unset)
    struct = NestedExample.new
    struct.required_struct = SimpleStruct.new required_string: nil

    ex = assert_raises Thrift::ProtocolException do
      Thrift::Validator.new.validate(struct)
    end
    assert_match /SimpleStruct/, ex.message
  end
end
