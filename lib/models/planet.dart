class Planet {
  int? id;
  String name;
  double distance;
  double size;
  String? nickname;

  Planet({
    this.id,
    required this.name,
    required this.distance,
    required this.size,
    this.nickname,
  });

  // Converte um Map para um objeto Planet
  factory Planet.fromMap(Map<String, dynamic> json) => Planet(
        id: json['id'],
        name: json['name'],
        distance: json['distance'].toDouble(),
        size: json['size'].toDouble(),
        nickname: json['nickname'],
      );

  // Converte um objeto Planet para um Map
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'distance': distance,
        'size': size,
        'nickname': nickname,
      };
}
