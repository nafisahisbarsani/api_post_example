import 'package:api_example/page/login/login_api_service.dart';
import 'package:get/get.dart';
import '../page/user_model.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var user = Rxn<UserModel>();

  // Fungsi login
  Future<void> login(String username, String password) async {
    isLoading.value = true;

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      isLoading.value = false;
      return;
    }

    try {
      final response = await LoginApiService.login(username, password);
      if (response != null && response['token'] != null) {
        user.value = UserModel.fromJson(response);
        Get.snackbar('Success', 'Login berhasil');
        Get.offAllNamed('/');
      } else {
        Get.snackbar(
            'Error',
            response?['message'] ??
                'Login gagal, periksa kembali username dan password');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
