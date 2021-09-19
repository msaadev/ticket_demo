import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ticket_try/view/tickets/model/ticket_model.dart';

abstract class ITicketService {
  final String path = 'test/bac96e9b-717b-40b5-8198-6bfe84fbe081/ticket';
  final Dio dio;

  ITicketService(this.dio);

  Future<TicketModel?> get getTicket;
}

class TicketService extends ITicketService {
  TicketService(Dio dio) : super(dio);

  @override
  Future<TicketModel?> get getTicket async {
    final response = await dio.get(path);

    if (response.statusCode == HttpStatus.ok) {
      return TicketModel.fromJson(response.data);
    }
    return null;
  }
}