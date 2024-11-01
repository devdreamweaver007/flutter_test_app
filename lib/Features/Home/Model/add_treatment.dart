class MyModel {
  final String id;
  final String name;
  final String man;
  final String women;

  MyModel({
    required this.id,
    required this.name,
    required this.man,
    required this.women,
  });

  factory MyModel.fromJson(Map<String, dynamic> json) {
    return MyModel(
      id: json['id'],
      name: json['name'],
      man: json['man'],
      women: json['women'],
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'man': man,
      'women': women,
    };
  }
}
