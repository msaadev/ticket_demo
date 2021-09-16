class TourModel {
  int? status;
  bool? success;
  String? message;
  List<Tours>? data;

  TourModel({this.status, this.success, this.message, this.data});

  TourModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add( Tours.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tours {
  String? route;
  String? departureTime;
  String? arrivalTime;
  String? tourType;
  List<String>? daysOfWeek;

  Tours(
      {this.route,
      this.departureTime,
      this.arrivalTime,
      this.tourType,
      this.daysOfWeek});

  Tours.fromJson(Map<String, dynamic> json) {
    route = json['route'];
    departureTime = json['departureTime'];
    arrivalTime = json['arrivalTime'];
    tourType = json['tourType'];
    daysOfWeek = json['daysOfWeek'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['route'] = route;
    data['departureTime'] = departureTime;
    data['arrivalTime'] = arrivalTime;
    data['tourType'] = tourType;
    data['daysOfWeek'] = daysOfWeek;
    return data;
  }
}