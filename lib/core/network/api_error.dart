class ApiError {
  final String? message;
  final int? statusCode;

        ApiError({this.message, this.statusCode});
  @override
  String toString() {
    return "Error is : $message \n  Status Code is $statusCode";
  }
}
