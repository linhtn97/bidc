class APIResponse {
  final int status;
  final String code;
  final String message;
  final Map data;

  APIResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'message': message,
        'data': data,
      };
}
