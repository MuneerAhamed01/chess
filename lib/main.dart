import 'package:chess/routes/r_route.dart';
import 'package:chess/routes/route_imp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    MyApp(
      routes: Routes(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routes});
  final RRoute routes;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Chess Game',
      getPages: routes.routes(),
      theme: ThemeData(
        fontFamily: 'inter',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
    );
  }
}
