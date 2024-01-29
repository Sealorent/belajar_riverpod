  // To parse this JSON data, do
  //
  //     final parseResponse = parseResponseFromMap(jsonString);

  class ParseResponse {
    ParseResponse({
      this.success = false,
      this.message,
    });

    final bool success;
    final dynamic message;

    factory ParseResponse.fromMap(dynamic json) {
      return ParseResponse(
        success: json['success'],
        message: json['message'],
      );
    }
  }
