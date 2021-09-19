class TicketModel {
  int? status;
  bool? success;
  String? message;
  TicketData? data;

  TicketModel({this.status, this.success, this.message, this.data});

  TicketModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? TicketData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class TicketData {
  String? passengerName;
  String? seatNu;
  String? departureCity;
  String? departureBusStop;
  String? departureTime;
  String? arrivalCity;
  String? arrivalBusStop;
  String? arrivalTime;
  String? tourNumber;
  String? date;
  String? ticketNumber;
  String? bookingNumber;
  String? qrCode;

  TicketData(
      {
      this.passengerName,
      this.seatNu,
      this.departureCity,
      this.departureBusStop,
      this.departureTime,
      this.arrivalCity,
      this.arrivalBusStop,
      this.arrivalTime,
      this.tourNumber,
      this.date,
      this.ticketNumber,
      this.bookingNumber,
      this.qrCode});

  TicketData.fromJson(Map<String, dynamic> json) {
    passengerName = json['passengerName'];
    seatNu = json['seatNu'];
    departureCity = json['departureCity'];
    departureBusStop = json['departureBusStop'];
    departureTime = json['departureTime'];
    arrivalCity = json['arrivalCity'];
    arrivalBusStop = json['arrivalBusStop'];
    arrivalTime = json['arrivalTime'];
    tourNumber = json['tourNumber'];
    date = json['date'];
    ticketNumber = json['ticketNumber'];
    bookingNumber = json['bookingNumber'];
    qrCode = json['qrCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['passengerName'] = passengerName;
    data['seatNu'] = seatNu;
    data['departureCity'] = departureCity;
    data['departureBusStop'] = departureBusStop;
    data['departureTime'] = departureTime;
    data['arrivalCity'] = arrivalCity;
    data['arrivalBusStop'] = arrivalBusStop;
    data['arrivalTime'] = arrivalTime;
    data['tourNumber'] = tourNumber;
    data['date'] = date;
    data['ticketNumber'] = ticketNumber;
    data['bookingNumber'] = bookingNumber;
    data['qrCode'] = qrCode;
    return data;
  }
}