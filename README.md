# Thrift::Validator

Recursive [thrift][] struct validator. The thrift library out of the
box does not validated nested structs, this library fixes that
problem. It does not monkey-patch the Thrift code. Instead this
library includes a class to recursively validate objects.

Here's an example from this libraries test. Take a look at this
protocol:

```thrift
struct SimpleStruct  {
  1: required string required_string
  2: optional string optional_string
}

struct NestedExample {
  1: required SimpleStruct required_struct
  2: optional SimpleStruct optional_struct
}
```

Then ran some ruby:

```ruby
struct = SimpleStruct.new
nested = NestedStruct.new required_struct: struct

# Method defined by the thrift library
struct.validate # => Thrift::ProtocolException

# Thrift only validate fields set as required on this instance.
# so since required_struct is non-nil validation succeeds.
# Also note that thrift does not validate the semantics of
# the assigned objects, so also assigning and invalid struct will
# pass its validation method.
nested.validate # => true

# With the validator
validator = Thrift::Validator.new
validator.validate nested # => Thrift::ProtocolException
```

## Semantics

* Original thrift validation smenatics enforces
* `optional` or `required` `struct` types pass validation
* `optional` or `required` `list<struct>` items pass validation
* `optional` or `required` `set<struct>` items pass validation
* `optional` or `required` `map` type using a `struct` for key or
  value pass validation


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'thrift-validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install thrift-validator

## Testing

First install `thrift` compilier on your platform.

	$ make test

## Contributing

1. Fork it ( https://github.com/saltside/thrift-validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[thrift]: https://thrift.apache.org
