struct SimpleStruct  {
  1: required string required_string
  2: optional string optional_string
}

struct NestedExample {
  1: required SimpleStruct required_struct
  2: optional SimpleStruct optional_struct
}

struct ListExample {
  1: required list<SimpleStruct> required_list
  2: optional list<SimpleStruct> optional_list
}

struct StringListExample {
  1: required list<string> required_list
}

struct StringSetExample {
  1: required set<string> required_set
}

struct SetExample {
  1: required set<SimpleStruct> required_set
  2: optional set<SimpleStruct> optional_set
}

struct MapKeyExample {
  1: required map<SimpleStruct, string> required_map
  2: optional map<SimpleStruct, string> optional_map
}

struct MapValueExample {
  1: required map<string, SimpleStruct> required_map
  2: optional map<string, SimpleStruct> optional_map
}

union UnionExample {
  1: SimpleStruct primary
  2: string alternate
}
