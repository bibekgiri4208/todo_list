class PersonModel {
  PersonModel({
    required this.id,
    required this.name,
    required this.profession,
    required this.age,
  });

  final String? id;
  final String? name;
  final String? profession;
  final int? age;

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json["id"],
      name: json["name"],
      profession: json["profession"],
      age: json["age"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "profession": profession,
    "age": age,
  };
}
