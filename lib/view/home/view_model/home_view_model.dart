import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:ticket_try/view/home/model/tour_model.dart';
import 'package:ticket_try/view/home/service/home_service.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final HomeService homeService;

  _HomeViewModelBase(this.homeService);

  Future<TourModel?> get getTours async => await homeService.getTours;

    IconData tourType(String type) {
    switch (type) {
      case 'Day':
        return Icons.wb_sunny;
      case 'Night':
        return Icons.bedtime;
      default:
        return Icons.wb_sunny;
    }
  }
}
