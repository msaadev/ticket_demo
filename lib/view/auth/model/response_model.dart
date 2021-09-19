class LoginResponse {
  int? status;
  bool? success;
  String? message;
  LoginData? data;

  LoginResponse({this.status, this.success, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class LoginData {
  String? email;
  String? userId;

  LoginData({this.email, this.userId});

  LoginData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = email;
    data['userId'] = userId;
    return data;
  }
}
