require_relative 'test_helper'

class AcceptanceTest < MiniTest::Unit::TestCase
  def test_follows_thrift_semantics
    struct = SimpleStruct.new required_string: nil, optional_string: nil
    refute_valid struct
  end

  def test_fails_if_a_required_nested_struct_is_invalid
    struct = NestedExample.new
    struct.required_struct = SimpleStruct.new
    refute_valid struct
  end

  def test_fails_if_an_optional_nested_struct_is_valid
    struct = NestedExample.new
    struct.required_struct = SimpleStruct.new required_string: 'foo'
    struct.optional_struct = SimpleStruct.new
    refute_valid struct
  end

  def test_passes_if_nested_structs_are_valid
    struct = NestedExample.new
    struct.required_struct = SimpleStruct.new required_string: 'foo'
    struct.optional_struct = SimpleStruct.new required_string: 'bar'
    assert_valid struct
  end

  def test_passes_if_nested_optional_struct_is_omitted
    struct = NestedExample.new
    struct.required_struct = SimpleStruct.new required_string: 'foo'
    assert_valid struct
  end

  def test_fails_if_a_nested_list_item_is_invalid
    struct = ListExample.new
    struct.required_list = [ SimpleStruct.new ]
    refute_valid struct
  end

  def test_fails_if_a_nested_list_item_is_invalid
    struct = ListExample.new
    struct.required_list = [ SimpleStruct.new({ required_string: 'foo' }) ]
    struct.optional_list = [ SimpleStruct.new ]
    refute_valid struct
  end

  def test_passes_if_given_valid_list_items
    struct = ListExample.new
    struct.required_list = [ SimpleStruct.new({ required_string: 'foo' }) ]
    struct.optional_list = [ SimpleStruct.new({ required_string: 'bar' }) ]
    assert_valid struct
  end

  def test_passes_with_primitives_list
    struct = StringListExample.new
    struct.required_list = [ 'foo' ]
    assert_valid struct
  end

  def test_fails_if_a_nested_set_item_is_invalid
    struct = SetExample.new
    struct.required_set = Set.new([ SimpleStruct.new ])
    refute_valid struct
  end

  def test_fails_if_a_nested_set_item_is_invalid
    struct = SetExample.new
    struct.required_set = Set.new([ SimpleStruct.new({ required_string: 'foo' }) ])
    struct.optional_set = Set.new([ SimpleStruct.new ])
    refute_valid struct
  end

  def test_passes_if_given_valid_set_items
    struct = SetExample.new
    struct.required_set = Set.new([ SimpleStruct.new({ required_string: 'foo' }) ])
    struct.optional_set = Set.new([ SimpleStruct.new({ required_string: 'bar' }) ])
    assert_valid struct
  end

  def test_passes_with_primitives_set
    struct = StringSetExample.new
    struct.required_set = Set.new([ 'foo' ])
    assert_valid struct
  end

  def test_fails_if_nested_map_key_is_invalid
    struct = MapKeyExample.new
    struct.required_map = { SimpleStruct.new => 'foo' }
    refute_valid struct
  end

  def test_fails_if_nested_map_key_is_invalid
    struct = MapKeyExample.new
    struct.required_map = { SimpleStruct.new({ required_string: 'foo' }) => 'foo' }
    struct.optional_map = { SimpleStruct.new => 'foo' }
    refute_valid struct
  end

  def test_passess_when_valid_map_keys_are_given
    struct = MapKeyExample.new
    struct.required_map = { SimpleStruct.new({ required_string: 'foo' }) => 'foo' }
    struct.optional_map = { SimpleStruct.new({ required_string: 'bar' }) => 'bar' }
    assert_valid struct
  end

  def test_fails_if_nested_map_value_is_invalid
    struct = MapValueExample.new
    struct.required_map = { 'foo' => SimpleStruct.new }
    refute_valid struct
  end

  def test_fails_if_optional_nested_map_value_is_invalid
    struct = MapValueExample.new
    struct.required_map = { 'foo' => SimpleStruct.new({ required_string: 'foo' }) }
    struct.required_map = { 'foo' => SimpleStruct.new }
    refute_valid struct
  end

  def test_passes_if_optional_and_required_valid_map_values_are_given
    struct = MapValueExample.new
    struct.required_map = { 'foo' => SimpleStruct.new({ required_string: 'foo' }) }
    struct.optional_map = { 'foo' => SimpleStruct.new({ required_string: 'bar' }) }
    assert_valid struct
  end

  def test_fails_if_no_union_fields_set
    union = UnionExample.new
    assert_raises(StandardError) do
      Thrift::Validator.new.validate(union)
    end
  end

  def test_fails_if_union_set_field_is_invalid
    union = UnionExample.new
    union.primary = SimpleStruct.new
    refute_valid union
  end

  def test_passes_if_union_set_field_is_valid
    union = UnionExample.new
    union.primary = SimpleStruct.new required_string: 'foo'
    assert_valid union
  end

  def test_passes_if_unions_alternate_value_is_provided
    union = UnionExample.new
    union.alternate = 'foo'
    assert_valid union
  end

  private

  def refute_valid(struct)
    assert_raises Thrift::ProtocolException, 'Incorrect validation' do
      Thrift::Validator.new.validate(struct)
    end
  end

  def assert_valid(struct)
    Thrift::Validator.new.validate(struct)
  rescue Thrift::ProtocolException => ex
    flunk ex
  end
end
