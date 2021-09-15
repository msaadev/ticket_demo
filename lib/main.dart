import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_try/core/init/cache/cache_manager.dart';
import 'package:ticket_try/core/init/provider/provider_list.dart';
import 'package:ticket_try/view/main/view/main_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheManager.prefrencesInit();

  runApp(MultiProvider(providers: [
    ...ProviderList.instance.dependItems,
    ...ProviderList.instance.singleItems,
    ...ProviderList.instance.uiChanges,
  ],
  
  child: MyApp(),
  
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticket Demo',
      home: MainView(),
    );
  }
}
