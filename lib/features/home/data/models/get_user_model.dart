class GetUserModel {
  GetUserModel({
      this.data,});

  GetUserModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.name, 
      this.email, 
      this.phone,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }
  String? id;
  String? name;
  String? email;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }

}