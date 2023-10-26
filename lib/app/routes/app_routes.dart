part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const LOGINPAGE = _Paths.LOGINPAGE;
  static const IKANVIEW = _Paths.IKANVIEW;
  static const IKANADD = _Paths.IKANADD;
  static const IKANDETAIL = _Paths.IKANDETAIL;
  static const IKANEDIT = _Paths.IKANEDIT;
}

abstract class _Paths {
  _Paths._();
  static const LOGINPAGE = "/loginPage";
  static const IKANVIEW = "/ikanView";
  static const IKANADD = "/ikanAdd";
  static const IKANDETAIL = "/ikanDetail";
  static const IKANEDIT = "/ikanEdit";
}
