import 'package:get/get.dart';

class FilterController extends GetxController {
  
  var showFilterResult = false.obs;

    void toggleShowFilterResult() {
    showFilterResult.value = !showFilterResult.value;
  }
}