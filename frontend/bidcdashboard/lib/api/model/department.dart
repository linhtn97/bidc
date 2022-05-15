import 'dart:ffi';

class Department {
  final Long id;
  final String code;
  final String name;
  final int status;

  Department({
    required this.id,
    required this.code,
    required this.name,
    required this.status,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
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
