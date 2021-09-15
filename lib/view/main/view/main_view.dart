import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_try/core/constants/app_constants.dart';
import 'package:ticket_try/core/init/provider/main_notifier.dart';
import 'package:ticket_try/view/home/view/home_view.dart';
import 'package:ticket_try/view/tickets/view/tickets_view.dart';

class MainView extends StatefulWidget {
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody,
      bottomNavigationBar: buidBottomNavigation(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppConstants.INTERNATIONAL_ORANGE,
      foregroundColor: Colors.white,
      centerTitle: true,
      leading: Icon(Icons.directions_bus_filled),
      title: Text('TEST APP '),
    );
  }


  BottomNavigationBar buidBottomNavigation() {
    return BottomNavigationBar(
        selectedItemColor: AppConstants.INTERNATIONAL_ORANGE,
        showSelectedLabels: true,
        currentIndex: context.watch<MainNotifier>().getPage,
        onTap: context.read<MainNotifier>().changePage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Homescreen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet),
            label: 'Tickets',
          ),
        ]);
  }

  Widget get buildBody {
    switch (context.watch<MainNotifier>().getPage) {
      case 0:
        return HomeView();
      case 1:
        return TicketView();

      default:
        return HomeView();
    }
  }
}
