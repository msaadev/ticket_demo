import 'package:flutter/material.dart';
import 'package:ticket_try/view/home/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('HomeView')),
    );
  }
}
