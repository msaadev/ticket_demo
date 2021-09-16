import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lib_msaadev/lib_msaadev.dart';
import 'package:ticket_try/view/home/service/home_service.dart';
import 'package:ticket_try/view/home/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel _viewModel;
  late final Dio _dio;
  late final BaseOptions _baseOptions;
  late final HomeService _service;

  @override
  void initState() {
    super.initState();
    _baseOptions = BaseOptions(
        baseUrl: 'https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/');
    _dio = Dio(_baseOptions);
    _service = HomeService(_dio);
    _viewModel = HomeViewModel(_service);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text('HomeView').onTap(() {
        _viewModel.getTours
            .then((value) => print('${value?.data?[0].daysOfWeek}'));
      })),
    );
  }
}
