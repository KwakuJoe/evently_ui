import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ticket_app_ui/data/datasources/remote/auth_remote_data_source.dart';
import 'package:ticket_app_ui/presentation/controllers/auth_controller.dart';
import '../../core/network/dio_client.dart';

class AuthDependencyInjection {
  static void init() {
    // Initialize AuthRemoteDataSource
    final authRemoteDataSource = AuthRemoteDataSource(dioClient: Get.find<DioClient>());

    // secure storage instance
    GetStorage storage = GetStorage();


    // Inject AuthRemoteDataSource into AuthController
    Get.lazyPut(() => AuthController(authRemoteDataSource: authRemoteDataSource, storage: storage));
  }
}