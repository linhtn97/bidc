import 'dart:ffi';

class Position {
  final Long id;
  final String code;
  final String name;
  final int status;

  Position({
    required this.id,
    required this.code,
    required this.name,
    required this.status,
  });

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'name': name,
        'status': status,
      };
}
