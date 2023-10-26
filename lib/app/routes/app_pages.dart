import 'package:get/get.dart';
import 'package:responsi/app/modules/ikan/views/ikan_add.dart';
import 'package:responsi/app/modules/ikan/views/ikan_detail.dart';
import 'package:responsi/app/modules/ikan/views/ikan_edit.dart';
import 'package:responsi/app/modules/ikan/views/ikan_view.dart';
import 'package:responsi/main.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.IKANVIEW;

  static final routes = [
    GetPage(
        name: _Paths.LOGINPAGE, page: () => const MyHomePage(title: "Aruvi")),
    GetPage(name: _Paths.IKANVIEW, page: () => const IkanView()),
    GetPage(name: _Paths.IKANADD, page: () => const IkanAdd()),
    GetPage(name: _Paths.IKANDETAIL, page: () => const IkanDetail()),
    GetPage(name: _Paths.IKANEDIT, page: () => const IkanEdit())
  ];
}
