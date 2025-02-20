import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/presentation/controllers/auth_controller.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/custom_text_input.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ThemeController themeController = Get.find<ThemeController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 10,
            children: [
              const Row(
                children: [
                  SizedBox(
                      width: 120,
                      child: Image(
                          image: AssetImage(
                        'assets/images/logo/logo.png',
                      )))
                ],
              ),
              const Text(
                'Log in to discover amazing event experiences.',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 30),
              Obx(() {
                return FormBuilder(
                    key: _formKey,
                    child: Column(
                      spacing: 10,
                      children: [
                        CustomTextField(
                          name: 'email',
                          label: 'Email',
                          errorText:
                              authController.loginValidationErrors['email'],
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          leadingIcon: const Icon(Icons.email_outlined),
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                  errorText: 'Email is required to login'),
                              FormBuilderValidators.email(
                                  errorText: 'Enter a valid email address'),
                            ],
                          ),
                        ),
                        CustomTextField(
                            name: 'password',
                            label: 'Password',
                            controller: passwordController,
                            errorText: authController
                                .loginValidationErrors['password'],
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
                                  errorText: 'Password is required to login'),
                              // FormBuilderValidators.password(),
                            ])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Get.toNamed('/forget-password');
                                },
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                      color: themeController.isDarkMode.value
                                          ? Colors.white38
                                          : Colors.black38),
                                ))
                          ],
                        ),
                        Obx(() {
                          return PrimaryButton(
                              label: 'Login',
                              loading: authController.isLoginLoading.value,
                              onPressed: () {
                                //  _formKey.currentState?.validate();
                                  Get.toNamed('/home-view');

                                // if (_formKey.currentState?.validate() == true) {
                                //   debugPrint(_formKey.currentState?.instantValue
                                //       .toString());
                                //   authController.login(
                                //       _formKey
                                //           .currentState?.instantValue['email'],
                                //       _formKey.currentState
                                //           ?.instantValue['password']);
                                //   // Get.offAllNamed('/personalize');
                                // }
                              });
                        })
                      ],
                    ));
              }),
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: themeController.isDarkMode.value
                                    ? Colors.white12
                                    : Colors.black12)),
                        child: const Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage(
                                    'assets/images/icons/google.png')),
                            Text(
                              'Continue with Google',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            )
                          ],
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/signup');
                          },
                          child: const Text('Create account today!'))
                    ],
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
