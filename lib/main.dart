import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bloc/screens/home_screen.dart';
import 'getx/home.dart';
import 'mobx/list.dart';
import 'redux/page.dart';
import 'riverpod/riverpod.dart';

void main() async {
  await GetStorage.init();
  runApp(const GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter State Manage Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const list = ['Riverpod', 'GetX', 'Mobx', 'Redux', 'Bloc'];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Material(
        color: Colors.grey,
        elevation: 6,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (var i = 0; i < list.length; i++) ...[
            ListTile(
              hoverColor: Colors.white,
              tileColor: Colors.white,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    switch (i) {
                      case 0:
                        return const ProviderScope(child: RiverPodPage());
                      case 1:
                        return const GetXPage();
                      case 2:
                        return const MobxPage();
                      case 3:
                        return const ReduxPage();
                      case 4:
                        return const BlocPage();
                      default:
                        return const RiverPodPage();
                    }
                  },
                ));
              },
              title: Center(child: Text(list[i])),
            ),
            const SizedBox(height: 12),
          ]
        ]),
      ),
    );
  }
}
