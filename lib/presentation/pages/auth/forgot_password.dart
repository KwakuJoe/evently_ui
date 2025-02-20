import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/presentation/controllers/auth_controller.dart';
import 'package:ticket_app_ui/presentation/widgets/custom_text_input.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final formKey = GlobalKey<FormBuilderState>();
  final TextEditingController emailController = TextEditingController();
  final ThemeController themeController = Get.find<ThemeController>();
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget password'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                const Text(
                  'Forgotten your password?',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'No worries, we we\'ll send you password instructions',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16,
                      color: themeController.isDarkMode.value
                          ? Colors.white54
                          : Colors.black45),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return FormBuilder(
                    key: formKey,
                    child: Column(
                      spacing: 20,
                      children: [
                        CustomTextField(
                          name: 'email',
                          label: 'Email',
                          errorText: authController
                              .forgetPasswordValidationErrors['email'],
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          leadingIcon: const Icon(Icons.email_outlined),
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                  errorText: 'Email is required'),
                              FormBuilderValidators.email(
                                  errorText: 'Enter a valid email address'),
                            ],
                          ),
                        ),
                        PrimaryButton(
                            label: 'Continue',
                            loading:
                                authController.isPasswordForgetLoading.value,
                            onPressed: () {
                              //  _formKey.currentState?.validate();
                              if (formKey.currentState?.validate() == true) {
                                debugPrint(
                                  formKey.currentState?.instantValue.toString(),
                                );

                                Get.toNamed('/reset-password');

                                // authController.forgotPassword(formKey
                                //     .currentState?.instantValue['email']);
                              }
                            })
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
