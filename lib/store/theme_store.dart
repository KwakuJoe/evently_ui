import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ticket_app_ui/presentation/utils/theme.dart';

class ThemeController extends GetxController {
  final _box = GetStorage(); // Use GetStorage for persistence
  var isDarkMode = true.obs; // dark mode set to false

  @override
  void onInit() {
    super.onInit();
    // Retrieve saved theme state
    isDarkMode.value = _box.read('isDarkMode') ?? true;
    Get.changeTheme(isDarkMode.value ? AppThemes.darkTheme : AppThemes.lightTheme);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _box.write('isDarkMode', isDarkMode.value); // Save state
    Get.changeTheme(isDarkMode.value ? AppThemes.darkTheme : AppThemes.lightTheme);
  }
}