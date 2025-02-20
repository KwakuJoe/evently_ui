import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:ticket_app_ui/presentation/controllers/auth_controller.dart';
import 'package:ticket_app_ui/presentation/widgets/custom_text_input.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isObscure = true;
  bool isOtpEntered = false;
  String otpCode = '';
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();
  final ThemeController themeController = Get.find<ThemeController>();
  final AuthController authController = Get.find<AuthController>();
  late String userEmail;

  @override
  void initState() {
    super.initState();
    userEmail = Get.arguments['email'].toString();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5E5E5)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
      borderRadius: BorderRadius.circular(20),
    );

    // final submittedPinTheme = defaultPinTheme.copyWith(
    //   decoration: defaultPinTheme.decoration?.copyWith(
    //     color: const Color(0xFF1F1F1F)
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm OTP'),
      ),
      body: Obx(() {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  const Text(
                    'Password reset',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                   authController.isPasswordForgetLoading.value ? 'Send new otp ...' : 'Enter otp sent to your email',
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
                  FormBuilder(
                    key: formKey,
                    child: Column(
                      spacing: 20,
                      children: [
                        // otp section
                        isOtpEntered
                            ? Column(
                                spacing: 10,
                                children: [
                                  CustomTextField(
                                      name: 'password',
                                      label: 'New Password',
                                      controller: passwordController,
                                      errorText: authController
                                              .resetPasswordValidationErrors[
                                          'password'],
                                      obscureText: isObscure,
                                      leadingIcon:
                                          const Icon(Icons.lock_clock_outlined),
                                      trailingIcon: IconButton(
                                        icon: const Icon(Icons.visibility),
                                        onPressed: () {
                                          setState(() {
                                            isObscure = !isObscure;
                                          });
                                          // Add functionality to toggle password visibility
                                        },
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(
                                            errorText:
                                                'Password is required to reset password'),
                                        // FormBuilderValidators.password(),
                                      ])),
                                  CustomTextField(
                                      name: 'password_confirmation',
                                      label: 'Confirm New Password',
                                      controller:
                                          passwordConfirmationController,
                                      errorText: authController
                                              .resetPasswordValidationErrors[
                                          'password_confirmation'],
                                      obscureText: isObscure,
                                      leadingIcon:
                                          const Icon(Icons.lock_clock_outlined),
                                      trailingIcon: IconButton(
                                        icon: const Icon(Icons.visibility),
                                        onPressed: () {
                                          setState(() {
                                            isObscure = !isObscure;
                                          });
                                          // Add functionality to toggle password visibility
                                        },
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(
                                          errorText: 'Please confirm password',
                                        ),
                                        FormBuilderValidators.password(),
                                        // FormBuilderValidators.password(),
                                      ])),
                                  PrimaryButton(
                                    label: 'Continue',
                                    loading: authController
                                        .isPasswordResetLoading.value,
                                    onPressed: () {
                                      //  _formKey.currentState?.validate();
                                      if (formKey.currentState?.validate() ==
                                          true) {
                                        debugPrint(
                                          formKey.currentState?.instantValue
                                              .toString(),
                                        );
                                        authController.resetPassword(
                                          userEmail,
                                          otpCode,
                                          formKey.currentState
                                              ?.instantValue['password'],
                                          formKey.currentState?.instantValue[
                                              'password_confirmation'],
                                        );
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 5),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isOtpEntered = false;
                                      });
                                    },
                                    child: customRichText(themeController),
                                  ),
                                ],
                              )
                            : Column(
                                spacing: 20,
                                children: [
                                  Center(
                                    child: Pinput(
                                      cursor: const Text('_'),
                                      enabled: true,
                                      pinAnimationType: PinAnimationType.scale,
                                      defaultPinTheme: defaultPinTheme,
                                      focusedPinTheme: focusedPinTheme,
                                      // submittedPinTheme: submittedPinTheme,
                                      length: 6, // Number of digits in the OTP
                                      onCompleted: (pin) {
                                        setState(() {
                                          isOtpEntered = true;
                                          otpCode = pin.toString();
                                        });

                                        debugPrint(
                                            "Entered OTP: $pin"); // Handle OTP submission
                                      },
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isOtpEntered = false;
                                      });

                                      // resend the otp code
                                      authController
                                          .forgotPassword(userEmail.toString());
                                    },
                                    child: customRichText(themeController),
                                  ),
                                ],
                              )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget customRichText(ThemeController controller) {
    return RichText(
      text: TextSpan(
          text: 'Didn\'t receive the email? ',
          style: TextStyle(
            fontSize: 16,
            color:
                controller.isDarkMode.value ? Colors.white54 : Colors.black45,
          ),
          children: [
            TextSpan(
                text: 'Click to resend',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor))
          ]),
    );
  }
}
