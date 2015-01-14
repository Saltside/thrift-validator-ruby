require 'thrift/validator/version'
require 'thrift'

module Thrift
  class Validator
    def validate(source)
      source.validate

      source.struct_fields.each_pair do |_, field|
        type, name = field.fetch(:type), field.fetch(:name)
        case type
        when Types::STRUCT
          validate source.send(name)
        when Types::LIST, Types::SET
          Array(source.send(name)).each do |item|
            validate item
          end
        when Types::MAP
          key_field = field.fetch(:key)
          if key_field[:class] && key_field[:class] < ::Thrift::Struct
            Hash(source.send(name)).each_key do |key_value|
              validate key_value
            end
          end

          value_field = field.fetch(:value)
          if value_field[:class] && value_field[:class] < ::Thrift::Struct
            Hash(source.send(name)).each_value do |value_value|
              validate value_value
            end
          end
        end
      end
    end
  end
end
