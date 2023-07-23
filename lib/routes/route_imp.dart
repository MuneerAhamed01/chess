import 'package:chess/routes/r_route.dart';
import 'package:chess/views/chess_board_page/chess_board.dart';
import 'package:get/get.dart';

class Routes extends RRoute {
  @override
  List<GetPage> routes() => [
        GetPage(
          name: ChessBoard.chessBoardPage,
          page: () => const ChessBoard(),
        ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
      ];

  @override
  String get initialRoute => ChessBoard.chessBoardPage;
}
