import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ticket_app_ui/data/general_data.dart';
import 'package:ticket_app_ui/data/user_interests.dart';
import 'package:ticket_app_ui/presentation/pages/profile/widgets/update_interest.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/custom_text_input.dart';
import 'package:ticket_app_ui/presentation/widgets/divider.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';

class UpdateUserProfile extends StatefulWidget {
  const UpdateUserProfile({super.key});

  @override
  State<UpdateUserProfile> createState() => _UpdateUserProfileState();
}

class _UpdateUserProfileState extends State<UpdateUserProfile> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
     final ThemeController themeController = Get.find<ThemeController>();

  final _formKey = GlobalKey<FormBuilderState>();
  FocusNode phoneFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              spacing: 20,
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 1,
                            )),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            radius: 52,
                            backgroundImage: AssetImage(
                              'assets/images/splash/splash.png',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).scaffoldBackgroundColor,
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            )),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            HugeIcons.strokeRoundedCamera01,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FormBuilder(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 15,
                      children: [
                        const Text('Personal Info'),
                        CustomDivider(),
                        CustomTextField(
                          name: 'first_name',
                          label: 'First name',
                          controller: firstNameController,
                          keyboardType: TextInputType.emailAddress,
                          // leadingIcon: const Icon(Icons.person_2_outlined),
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                  errorText:
                                      'First name is required to sign up'),
                            ],
                          ),
                        ),
                        CustomTextField(
                          name: 'last_name',
                          label: 'Last name',
                          controller: firstNameController,
                          keyboardType: TextInputType.emailAddress,
                          // leadingIcon: const Icon(Icons.person_2_outlined),
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                  errorText:
                                      'Last name is required to update profile'),
                            ],
                          ),
                        ),
                        CustomTextField(
                          name: 'email',
                          label: 'Email',
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
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            labelText: 'Phone Number',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required( errorText: 'Phone is required to update'),
                            ],
                          ),
                          languageCode: "gh",
                          countries: activeCountries,
                          onChanged: (phone) {
                            debugPrint(phone.completeNumber);
                          },
                          onCountryChanged: (country) {
                            debugPrint('Country changed to: ' + country.name);
                          },
                        ),
                        const Text('Interest'),
                        CustomDivider(),
                        UpdateUserInterest(
                          chipOptions: chipOptions,
                          onSelectionChanged: (selectedItems) {
                            debugPrint(selectedItems.toString());
                          },
                        ),
                        CustomDivider(),
                        PrimaryButton(
                            label: 'Update profile',
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
