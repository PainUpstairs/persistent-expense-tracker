class Lookup {
  int? id;
  String name;
  String code;
  String description;
  int isSynced;


  Lookup({required this.name, required this.code, required this.description, this.isSynced = 0,  this.id});

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "code": code, "description": description, "isSynced": isSynced};
  }

  @override
  String toString() {
    // TODO: implement toString
    return "[id: $id, name: $name, code: $code, description: $description, isSynced: $isSynced]";
  }

  factory Lookup.fromSqfliteDatabase(Map<String,dynamic> map) => Lookup(
    id: map["id"],
    name: map["name"],
    code:map["code"],
    description:map["description"],
    isSynced: map["isSynced"]??0
  );


}
