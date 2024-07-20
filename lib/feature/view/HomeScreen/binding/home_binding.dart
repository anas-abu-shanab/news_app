import 'package:get/get.dart';
import 'package:news_app/feature/view_model/home_view_model.dart';


class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
  }

}