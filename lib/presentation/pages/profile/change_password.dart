import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/custom_text_input.dart';
import 'package:ticket_app_ui/presentation/widgets/divider.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _UpdateUserProfileState();
}

class _UpdateUserProfileState extends State<ChangePassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
     final ThemeController themeController = Get.find<ThemeController>();
  final TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;

  final _formKey = GlobalKey<FormBuilderState>();
  FocusNode phoneFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              spacing: 20,
              children: [
                FormBuilder(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 15,
                      children: [
                        Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Change your password',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Enter current password, new password and confirm it to update your password.',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: themeController.isDarkMode.value
                                      ? Colors.white54
                                      : Colors.black45),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        CustomTextField(
                            name: 'current_password',
                            label: 'Current password',
                            controller: passwordController,
                            obscureText: _isObscure,
                            leadingIcon: const Icon(Icons.lock_clock_outlined),
                            trailingIcon: IconButton(
                              icon: const Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                                // Add functionality to toggle password visibility
                              },
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText:
                                      'Current Password is required to proceed'),
                              // FormBuilderValidators.password(),
                            ])),

                        CustomTextField(
                            name: 'new_password',
                            label: 'New password',
                            controller: passwordController,
                            obscureText: _isObscure,
                            leadingIcon: const Icon(Icons.lock_clock_outlined),
                            trailingIcon: IconButton(
                              icon: const Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                                // Add functionality to toggle password visibility
                              },
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText:
                                      'New Password is required to proceed'),
                              // FormBuilderValidators.password(),
                            ])),
                        CustomTextField(
                            name: 'confirm_password',
                            label: 'Confirm password',
                            controller: passwordController,
                            obscureText: _isObscure,
                            leadingIcon: const Icon(Icons.lock_clock_outlined),
                            trailingIcon: IconButton(
                              icon: const Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                                // Add functionality to toggle password visibility
                              },
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText:
                                      'New Password is required to proceed'),
                              // FormBuilderValidators.password(),
                            ])),
                        CustomDivider(),
                        PrimaryButton(
                            label: 'Update password',
                            onPressed: () {
                              //  _formKey.currentState?.validate();
                              if (_formKey.currentState?.validate() == true) {
                                debugPrint(_formKey.currentState?.instantValue
                                    .toString());
                                Get.offAllNamed('/personalize');
                              }
                            })
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
