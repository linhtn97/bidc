class Staff {
  final String id;
  final String code;
  final String firstName;
  final String lastName;
  // final String fullName;
  final dynamic dateOfBirth;
  final int branchId;
  final int departmentId;
  final int positionId;
  final dynamic joinDate;
  final int status;

  Staff(
      {required this.id,
      required this.code,
      required this.firstName,
      required this.lastName,
      // required  this.fullName,
      required this.dateOfBirth,
      required this.branchId,
      required this.departmentId,
      required this.positionId,
      required this.joinDate,
      required this.status});

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: json['id'],
      code: json['code'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateOfBirth: json['dateOfBirth'],
      branchId: json['branchId'],
      departmentId: json['departmentId'],
      positionId: json['positionId'],
      joinDate: json['joinDate'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth,
        'branchId': branchId,
        'departmentId': departmentId,
        'positionId': positionId,
        'joinDate': joinDate,
        'status': status,
      };
}
