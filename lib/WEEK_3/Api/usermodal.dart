class Usermodal {
  Usermodal({
      this.status, 
      this.statusCode, 
      this.message, 
      this.data,});

  Usermodal.fromJson(dynamic json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? status;
  int? statusCode;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusCode'] = statusCode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.userId, 
      this.name, 
      this.email, 
      this.profilePic, 
      this.badgeCount, 
      this.deviceType, 
      this.deviceToken, 
      this.uniqueToken, 
      this.createdAt,});

  Data.fromJson(dynamic json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    profilePic = json['profile_pic'];
    badgeCount = json['badge_count'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    uniqueToken = json['unique_token'];
    createdAt = json['created_at'];
  }
  int? userId;
  String? name;
  String? email;
  String? profilePic;
  int? badgeCount;
  dynamic deviceType;
  dynamic deviceToken;
  dynamic uniqueToken;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['name'] = name;
    map['email'] = email;
    map['profile_pic'] = profilePic;
    map['badge_count'] = badgeCount;
    map['device_type'] = deviceType;
    map['device_token'] = deviceToken;
    map['unique_token'] = uniqueToken;
    map['created_at'] = createdAt;
    return map;
  }

}