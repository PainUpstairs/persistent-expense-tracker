import 'dart:core';
import 'dart:ffi';

class Item {
  int? id;
  String type;
  String name;
  String? value;
  String createdAt;
  String? category;
  int isSynced;
  
  Item(
      {required this.id,
      required this.type,
      required this.name,
      this.value,
      required this.createdAt,
      this.category,
      this.isSynced = 0,
      });

  Map<String, dynamic> toMap() {
    return {
      "type": type,
      "name": name,
      "value": value,
      "category": category,
      "createdAt": createdAt,
      "isSynced":isSynced
    };
  }

  factory Item.fromSqfliteDatabase(Map<String,dynamic> map) => Item(
    id: map["id"],
    type: map["type"],
    name: map["name"],
    value:map["value"],
    category: map["category"],
    createdAt: map["createdAt"],
    isSynced: map["isSynced"]??0
  );

  @override
  String toString() {
    return "[id:$id, type: $type, name: $name, value: $value, category: $category, createdAt: $createdAt, isSynced: $isSynced]";
  }
}
