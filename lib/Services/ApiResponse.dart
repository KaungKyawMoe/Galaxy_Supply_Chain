class ApiResponse{

  int? statusCode;

  dynamic data;

  String? statusMessage;

  ApiResponse({this.data,this.statusCode,this.statusMessage});

}