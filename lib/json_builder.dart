class JsonBuilder {
  int id;
  String entityId;
  String code;
  String name;
  String fullPath;
  bool isLocationGroup;
  Map<String,dynamic> parent;
  // Parent parent;

  JsonBuilder(
      {required this.id,
      required this.entityId,
      required this.code,
      required this.name,
      required this.fullPath,
      required this.isLocationGroup,
      required this.parent
      });

  factory JsonBuilder.fromJson(Map<String, dynamic> jsonMap) {
    return JsonBuilder(
        id: jsonMap["id"] ?? 0,
        entityId: jsonMap["entityId"] ?? "null",
        code: jsonMap["code"] ?? "null",
        name: jsonMap["name"] ?? "null",
        fullPath: jsonMap["fullPath"] ?? "null",
        isLocationGroup: jsonMap["isLocationGroup"] ?? false,
        parent: jsonMap["parent"] ?? Map<String,dynamic>()
    );
  }
}

// class Parent {
//   int id;
//   String entityId;
//   String code;
//   String name;
//   String fullPath;
//   bool isLocationGroup;
//
//   Parent(
//       {required this.id,
//       required this.entityId,
//       required this.code,
//       required this.name,
//       required this.fullPath,
//       required this.isLocationGroup});
//
//   factory Parent.fromJson(Map<String, dynamic> jsonMap) {
//     return Parent(
//         id: jsonMap["id"] ?? 0,
//         entityId: jsonMap["entityId"] ?? "qwe",
//         code: jsonMap["code"] ?? "sdsfs",
//         name: jsonMap["name"] ?? "addda",
//         fullPath: jsonMap["fullPath"] ?? "sfsgs",
//         isLocationGroup: jsonMap["isLocationGroup"] ?? false);
//   }
//
// }
