import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ticket_app_ui/data/general_data.dart';
import 'package:ticket_app_ui/presentation/controllers/auth_controller.dart';
import 'package:ticket_app_ui/presentation/widgets/divider.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/custom_text_input.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final ThemeController themeController = Get.find<ThemeController>();
  final TextEditingController name = TextEditingController();
  String phoneNumber = '';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  final AuthController authController = Get.find<AuthController>();
  FocusNode phoneFocusNode = FocusNode();
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
                'Create an account today!, enjoy endless events.',
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
                        IntlPhoneField(
                          focusNode: phoneFocusNode,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                          pickerDialogStyle: PickerDialogStyle(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 20),
                              listTileDivider: CustomDivider()),
                          decoration: InputDecoration(
                            errorText:
                                authController.signupValidationErrors['phone'],
                            contentPadding: const EdgeInsets.all(20),
                            labelText: 'Phone Number',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'Email is required to sign up'),
                          ]),
                          languageCode: "gh",
                          countries: activeCountries,
                          onChanged: (phone) {
                            debugPrint(phone.completeNumber);
                            phoneNumber = phone.completeNumber;
                          },
                          onCountryChanged: (country) {
                            debugPrint('Country changed to: ' + country.name);
                          },
                        ),
                        CustomTextField(
                            name: 'full_name',
                            label: 'Name',
                            controller: name,
                            keyboardType: TextInputType.emailAddress,
                            errorText:
                                authController.signupValidationErrors['name'],
                            // leadingIcon: const Icon(Icons.person_2_outlined),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Name is required to sign up'),
                            ])),
                        CustomTextField(
                            name: 'email',
                            label: 'Email',
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            errorText:
                                authController.signupValidationErrors['email'],
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Email is required to sign up'),
                              FormBuilderValidators.email(
                                  errorText: 'Enter a valid email address'),
                            ])),
                        CustomTextField(
                            name: 'password',
                            label: 'Password',
                            controller: passwordController,
                            obscureText: _isObscure,
                            errorText: authController
                                .signupValidationErrors['password'],
                            // leadingIcon: const Icon(Icons.lock_clock_outlined),
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
                                  errorText: 'Password is required to sign up'),
                              // FormBuilderValidators.password(),
                            ])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                      color: themeController.isDarkMode.value
                                          ? Colors.white38
                                          : Colors.black38),
                                ))
                          ],
                        ),
                        PrimaryButton(
                            label: 'Create account',
                            loading: authController.isRegisterLoading.value,
                            onPressed: () {
                              //  _formKey.currentState?.validate();
                              if (_formKey.currentState?.validate() == true) {
                                debugPrint(_formKey.currentState?.instantValue
                                    .toString());
                                if (phoneNumber.isEmpty) {
                                  Get.snackbar('Phone number is empty',
                                      'Please enter a valid phon number');
                                }

                                  Get.toNamed('/personalize');


                                // authController.register(
                                //     _formKey.currentState
                                //         ?.instantValue['full_name'],
                                //     _formKey
                                //         .currentState?.instantValue['email'],
                                //     _formKey
                                //         .currentState?.instantValue['password'],
                                //     phoneNumber.toString());
                              }
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
                            Get.back();
                          },
                          child: const Text('Login into your account'))
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
