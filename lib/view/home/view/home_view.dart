import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lib_msaadev/lib_msaadev.dart';
import 'package:ticket_try/core/components/image/stacked_image.dart';
import 'package:ticket_try/core/constants/app_constants.dart';
import 'package:ticket_try/view/home/model/tour_model.dart';
import 'package:ticket_try/view/home/service/home_service.dart';
import 'package:ticket_try/view/home/view/home_resources.dart';
import 'package:ticket_try/view/home/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeResources {
  late final HomeViewModel _viewModel;
  late final Dio _dio;
  late final BaseOptions _baseOptions;
  late final HomeService _service;

  @override
  void initState() {
    super.initState();
    _baseOptions = BaseOptions(baseUrl: baseUrl);
    _dio = Dio(_baseOptions);
    _service = HomeService(_dio);
    _viewModel = HomeViewModel(_service);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: crossStart,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                StackedImage(
                  link: imageLink,
                  label: imageLabel,
                ),
                Padding(
                  padding: [12, 16].paddingSymmetric,
                  child: Text(
                    header,
                    style: context.textTheme.headline6!,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: _viewModel.getTours.build(child: (data) {
            data as TourModel?;
            if (data != null) {
              return ListView.separated(
                padding: 16.paddingSymmetricHorizontal,
                itemCount: data.data!.length,
                separatorBuilder: (c, i) {
                  return const Divider(
                    color: AppConstants.ALTO,
                    height: 1,
                    thickness: 1,
                  );
                },
                itemBuilder: (c, i) {
                  var item = data.data?[i];
                  return Container(
                    padding: 16.paddingSymmetricVertical,
                    color: AppConstants.WILD_SAND,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            _viewModel.tourType(item!.tourType!),
                            color: context.theme.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: crossStart,
                            children: [
                              Text(
                                item.route ?? '',
                                style: context.textTheme.headline6!
                                    .copyWith(fontSize: 14),
                              ),
                              4.hSized,
                              Text(
                                item.daysOfWeek!.join(' - '),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(child:  Text('Veri Bulunamadı'));
            }
          }))
        ],
      ),
    );
  }
}
