import 'package:api_example/widget/my_button.dart';
import 'package:api_example/widget/my_color.dart';
import 'package:api_example/widget/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/register_controller.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController registerController = Get.put(RegisterController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MyTextField(
              hintText: 'Username',
              isObsecure: false,
              fontsize: 15,
              controller: usernameController,
            ),
            MyTextField(
              hintText: 'Password',
              isObsecure: true,
              fontsize: 15,
              controller: passwordController,
            ),
            MyTextField(
              hintText: 'Full name',
              isObsecure: false,
              fontsize: 15,
              controller: fullNameController,
            ),
            MyTextField(
              hintText: 'Email',
              isObsecure: false,
              fontsize: 15,
              controller: emailController,
            ),
            SizedBox(height: 20),
            Obx(() => registerController.isLoading.value
                ? CircularProgressIndicator()
                : MyButton(
                    text: 'Register',
                    color: textColor,
                    onPressed: () {
                      final username = usernameController.text.trim();
                      final password = passwordController.text.trim();
                      final fullName = fullNameController.text.trim();
                      final email = emailController.text.trim();

                      if (username.isEmpty ||
                          password.isEmpty ||
                          fullName.isEmpty ||
                          email.isEmpty) {
                        Get.snackbar('Error', 'All fields are required');
                        return;
                      }

                      registerController.register(
                          username, password, fullName, email);
                    },
                    fontSize: 14, fontWeight: FontWeight.bold,)),
          ],
        ),
      ),
    );
  }
}
