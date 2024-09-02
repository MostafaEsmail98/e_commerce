class ErrorModel {
  final int status ;
  final String errMassage ;

  ErrorModel({required this.status, required this.errMassage});

  factory ErrorModel.fromJson(Map<String,dynamic> jsonData){
  return ErrorModel(status: jsonData["status"] , errMassage: jsonData["errMassage"])  ;
  }
}