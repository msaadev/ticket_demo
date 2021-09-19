import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lib_msaadev/lib_msaadev.dart';
import 'package:provider/provider.dart';
import 'package:ticket_try/core/constants/app_constants.dart';
import 'package:ticket_try/core/init/provider/main_notifier.dart';
import 'package:ticket_try/view/auth/view/login_view.dart';
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
      backgroundColor: context.theme.primaryColor,
      foregroundColor: Colors.white,
      centerTitle: true,
      leading: const Icon(Icons.directions_bus_filled).onTap(() =>
          AwesomeDialog(
                  context: context,
                  width: context.customWidth(1),
                  dialogType: DialogType.NO_HEADER,
                  body: LoginView())
              .show()),
      title: Text(
          context.watch<MainNotifier>().getPage == 0 ? 'TEST APP' : 'Tickets'),
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
