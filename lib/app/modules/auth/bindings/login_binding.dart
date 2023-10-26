import 'package:get/get.dart';
import 'package:responsi/app/modules/auth/controller/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
