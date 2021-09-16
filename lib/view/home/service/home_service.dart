
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ticket_try/view/home/model/tour_model.dart';

abstract class IHomeService {
  final String path = 'test/departureTimes';
  final Dio dio;

  IHomeService(this.dio);

  Future<TourModel?> get getTours;
}

class HomeService extends IHomeService {
  HomeService(Dio dio) : super(dio);

  @override
  Future<TourModel?> get getTours async {
    final response = await dio.get(path);

    if (response.statusCode == HttpStatus.ok) {
      return TourModel.fromJson(response.data);
    }
    return null;
  }
}

//https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/departureTimes