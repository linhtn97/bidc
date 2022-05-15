import 'dart:ffi';

class Branch {
  final Long id;
  final String code;
  final String name;
  final int status;

  Branch({
    required this.id,
    required this.code,
    required this.name,
    required this.status,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
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
