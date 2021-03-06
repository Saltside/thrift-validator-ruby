require 'thrift/validator/version'
require 'thrift'

module Thrift
  class Validator
    def validate(source)
      begin
        source.validate
      rescue Thrift::ProtocolException => ex
        message = "#{source.class.name}: #{ex}"
        raise Thrift::ProtocolException.new(ex.type, message)
      end

      source.struct_fields.each_pair do |_, field|
        type, name = field.fetch(:type), field.fetch(:name)
        case type
        when Types::STRUCT
          next if source.kind_of?(Union) && source.get_set_field.to_s != name

          if source.send(name)
            validate source.send(name)
          end
        when Types::LIST, Types::SET
          if recurse? field.fetch(:element)
            Array(source.send(name)).each do |item|
              validate item
            end
          end
        when Types::MAP
          if recurse? field.fetch(:key)
            Hash(source.send(name)).each_key do |key_value|
              validate key_value
            end
          end

          if recurse? field.fetch(:value)
            Hash(source.send(name)).each_value do |value_value|
              validate value_value
            end
          end
        end
      end
    end

    def recurse?(field)
      field[:class] && field[:class] < ::Thrift::Struct
    end
  end
end
