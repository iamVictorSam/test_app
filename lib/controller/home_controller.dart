import 'package:get/get.dart';

class HomeController extends GetxController {
  List<RxBool> favoriteStates = [];

  void initFavoriteStates(int length) {
    favoriteStates = List.generate(length, (index) => false.obs);
  }

  void toggleFavorite(int index) {
    favoriteStates[index].toggle();
  }
}
