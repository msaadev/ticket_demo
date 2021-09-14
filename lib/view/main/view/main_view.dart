import 'package:flutter/material.dart';
import 'package:ticket_try/core/constants/app_constants.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.INTERNATIONAL_ORANGE,
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(Icons.directions_bus_filled),
        title: Text('TEST APP '),
      ), 
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppConstants.INTERNATIONAL_ORANGE,
          showSelectedLabels: true,
          currentIndex: 1,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Homescreen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet),
              label: 'Tickets',
            ),
          ]),
      body: Center(child: Text('MainView')),
    );
  }
}
