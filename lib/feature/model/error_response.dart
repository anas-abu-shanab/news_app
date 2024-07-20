class ErrorResponse {
  ErrorResponse({
    this.message,
    this.status,
    this.code,
    this.statusCode,
    this.details,
    this.error,
  });

  String? message;
  bool? status = false;
  dynamic statusCode;
  String? code;
  Details? details;
  Error? error;

  factory ErrorResponse.fromJson(Map<String, dynamic> json, int statusCode) {
    return ErrorResponse(
      status: false,
      message: json["message"],
      code: json["code"],
      statusCode: statusCode ,
      error: json["error"] == null ? null : Error.fromJson(json["error"]),
    );
  }

  Map<String, dynamic> toJson() {
    try {
      return {
        "message": message,
        "code": code,
        "details": details?.toJson(),
        "error": error?.toJson(),
      };
    } catch (e) {
      throw Exception(e);
    }
  }
}

class Details {
  Details();

  factory Details.fromJson(Map<String, dynamic> json) => Details();

  Map<String, dynamic> toJson() => {};
}

class Error {
  Error({
    this.status,
    this.code,
    this.details,
    this.statusCode,
    this.message,
  });

  int? status;
  String? code;
  String? message;
  Details? details;
  int? statusCode;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        status: json["status"],
    message: json["message"],
        code: json["code"],
        details:
            json["details"] == null ? null : Details.fromJson(json["details"]),
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() {
    try {
      return {
        "status": status,
        "code": code,
        "details": details?.toJson(),
        "status_code": statusCode,
      };
    } catch (e) {
      throw Exception(e);
    }
  }
}
