import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lib_msaadev/lib_msaadev.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticket_try/core/constants/app_constants.dart';
import 'package:ticket_try/view/tickets/service/ticket_service.dart';
import 'package:ticket_try/view/tickets/view/tickets_resources.dart';
import 'package:ticket_try/view/tickets/view_model/ticket_view_model.dart';

class TicketView extends StatefulWidget {
  const TicketView({Key? key}) : super(key: key);

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> with TicketsResources {
  late final TicketService _ticketService;
  late final TicketViewModel _viewModel;
  late final Dio _dio;
  late final BaseOptions _baseOptions;
  late final Future getTicket;

  @override
  void initState() {
    super.initState();
    _baseOptions = BaseOptions(baseUrl: baseUrl);
    _dio = Dio(_baseOptions);
    _ticketService = TicketService(_dio);
    _viewModel = TicketViewModel(_ticketService);
    getTicket = _viewModel.getTicket;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: [33, 36].paddingSymmetric,
        padding: 20.paddingAll,
        width: double.infinity,
        height: 500,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: 8.customRadius,
            gradient: const LinearGradient(
                colors: [AppConstants.INTERNATIONAL_ORANGE, Colors.white],
                begin: Alignment(0, -3),
                end: Alignment.bottomCenter),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black12,
                offset: Offset(3, 4),
                spreadRadius: 3,
              )
            ]),
      ),
    );
  }
}
