class ErrorModel {
  final String errMassage ;

  ErrorModel({required this.errMassage});

  factory ErrorModel.fromJson(Map<String,dynamic> jsonData){
  return ErrorModel( errMassage: jsonData["message"])  ;
  }
}