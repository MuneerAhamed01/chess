import 'package:get/get.dart' show GetPage;

abstract class RRoute {
  // Initial Route When we Start the application
  String get initialRoute;

  // List of Routes
  List<GetPage> routes();
}
