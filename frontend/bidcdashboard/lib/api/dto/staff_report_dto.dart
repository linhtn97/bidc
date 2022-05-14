class StaffReportDTO {
  final String id;
  final String code;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String joinDate;
  final String status;
  final String branch;
  final String department;
  final String position;

  StaffReportDTO({
    required this.id,
    required this.code,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.joinDate,
    required this.status,
    required this.branch,
    required this.department,
    required this.position,
  });

  factory StaffReportDTO.fromJson(Map<String, dynamic> json) {
    return StaffReportDTO(
      id: json['id'],
      code: json['code'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateOfBirth: json['dateOfBirth'],
      joinDate: json['joinDate'],
      status: json['status'],
      branch: json['branch'],
      department: json['department'],
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth,
        'joinDate': joinDate,
        'status': status,
        'branch': branch,
        'department': department,
        'position': position,
      };
}
