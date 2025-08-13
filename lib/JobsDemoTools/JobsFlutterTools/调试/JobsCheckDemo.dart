import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/%E8%B0%83%E8%AF%95/JobsCheck.dart';

void main() {
  final mockData = {
    "status": "success",
    "code": 200,
    "meta": {
      "page": 1,
      "total": 3,
    },
    "user": {
      "id": 123,
      "name": "Alice",
      "roles": ["admin", "editor", "user"],
      "settingsJson":
          '{"theme": "dark", "language": "en", "notifications": {"email": true, "sms": false}}', // JSON字符串
      "address": {
        "city": "Wonderland",
        "zip": "12345",
        "coords": [51.5074, 0.1278]
      }
    },
    "items": [
      {
        "id": 1,
        "name": "Item 1",
        "price": 10.5,
        "tagsJson": '["tag1", "tag2", {"nested": "value"}]', // JSON字符串
      },
      {
        "id": 2,
        "name": "Item 2",
        "price": 20.0,
        "details": {"weight": "1kg", "color": "red"}
      }
    ],
    "rawJson": '{"a":1,"b":[2,3,{"c":4}]}', // JSON字符串
  };

  final mockListData = [
    {
      "id": 1,
      "name": "First",
      "metaJson":
          '{"views": 100, "likes": 50, "tags": ["news", "sports"]}', // JSON字符串
      "details": {
        "category": "A",
        "attributes": [
          {"key": "color", "value": "red"},
          {"key": "size", "value": "M"}
        ]
      }
    },
    {
      "id": 2,
      "name": "Second",
      "metaJson":
          '{"views": 200, "likes": 120, "tags": ["tech", "gaming"]}', // JSON字符串
      "details": {
        "category": "B",
        "attributes": [
          {"key": "material", "value": "cotton"},
          {"key": "origin", "value": "USA"}
        ]
      }
    },
    '{"jsonStringRoot": true, "nested": {"a": 1, "b": [10, 20]}}' // 根List里的JSON字符串
  ];

  // 打印整个对象
  po(mockData);
  // 打印指定路径
  po(mockData, path: 'user.settingsJson');

  print("");
}
