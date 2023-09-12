import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/custom_colors.dart';
import '../../../core/styles/custom_dimensions.dart';
import '../../../core/styles/custom_text_styles.dart';
import '../../../core/utils/validator.dart';
import '../../../widgets/base_scaffold.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_phone_field.dart';
import '../../../widgets/custom_text_field.dart';

class SignUpPageMobile extends StatefulWidget {
  const SignUpPageMobile({super.key});

  @override
  State<SignUpPageMobile> createState() => _SignUpPageMobileState();
}

class _SignUpPageMobileState extends State<SignUpPageMobile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _checkBoxValue = false;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final phone = TextEditingController();

  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _hasUppercaseLetter = false;
  bool _hasSpecialCharacter = false;
  bool _hasLowercaseLetter = false;
  //bool _hasNoIllegalCharacters = false;

  bool _isOverLayVisible = false;
  final _focusNode = FocusNode();

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;

      _hasUppercaseLetter = false;
      if (password != password.toLowerCase()) _hasUppercaseLetter = true;

      _hasSpecialCharacter = false;
      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        _hasSpecialCharacter = true;
      }

      _hasLowercaseLetter = false;
      if (password != password.toUpperCase()) _hasLowercaseLetter = true;

      /* _hasNoIllegalCharacters = false;
      if (!password.contains(RegExp(r'123|234|345|456|567|789'))) {
        _hasNoIllegalCharacters = true;
      }*/
    });
  }

  List<String> _titleList = [];
  String? _selectedType;
  //final List<String> _cachedTitleList = locator<LocalCache>().getTitleList();
  @override
  void initState() {
    //ref.read(authProvider);
    //log firebase analytics
    // ref
    //     .read(firebaseAnalyticsProvider)
    //     .setCurrentScreen(screenName: "Sign Up Screen", screenClassOverride: "Sign up Screen Screen");
    getTitleList();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _isOverLayVisible = true;
        });
      } else {
        setState(() {
          _isOverLayVisible = false;
        });
      }
    });
    super.initState();
  }

  void getTitleList() {
    //_titleList = List.from(_titleList)..addAll(ref.read(runtimeDataNotifier).titleList ?? _cachedTitleList);
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    phone.dispose();
    super.dispose();
  }

  void itemSelectionChanged(String? value) {
    _selectedType = value!;
  }

  @override
  Widget build(BuildContext context) {
    // final signProvider = ref.watch(authProvider);
    // ref.watch(runtimeDataNotifier);
    return BaseScaffold(
        backgroundColor: CustomColors.peer2ColorAccent,
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: -8,
          backgroundColor: CustomColors.primaryColor,
          actions: [
            TextButton(
              onPressed: () {
                //Navigator.pushNamed(context, SignInScreen.id);
              },
              child: Text(
                "Log In",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
        onWillPop: () {
          Navigator.pop(context);
        },
        builder: ((size) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: CustomDimensions.largeMargin),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Join Kada",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: CustomColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Title',
                                style: CustomTextStyle.textStyleRegular.copyWith(
                                  color: CustomColors.textFieldTitleColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                                children: [
                                  TextSpan(
                                    text: '',
                                    style: CustomTextStyle.textStyleRegular.copyWith(
                                      color: CustomColors.redColor,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: CustomColors.textFieldBackgroundColor,
                          ),
                          child: DropdownSearch<String>(
                            popupProps: PopupProps.menu(
                              showSearchBox: true,
                              showSelectedItems: true,
                              searchFieldProps: TextFieldProps(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  cursorColor: CustomColors.schoolCardTextColor,
                                  decoration: InputDecoration(
                                    fillColor: CustomColors.secondaryColor,
                                    focusColor: CustomColors.primaryColor,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    hintText: 'Search',
                                    hintStyle: CustomTextStyle.textStyleRegular.copyWith(
                                      color: CustomColors.schoolCardSubTextColor,
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.search,
                                      size: 20,
                                      color: CustomColors.schoolCardSubTextColor,
                                    ),
                                  )),
                            ),
                            items: _titleList, //_titleList,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                hintText: 'Select a title',
                                contentPadding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: CustomColors.textFieldBorderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.w,
                                    color: CustomColors.textFieldBorderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.w,
                                    color: CustomColors.primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            onChanged: itemSelectionChanged,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      title: 'First name',
                      isRequired: true,
                      controller: firstName,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      autoValidateMode: AutovalidateMode.disabled,
                      maxLength: 30,
                      formatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'([A-Za-z])-?')),
                      ],
                      validator: Validators.validateIsEmptyWithLengthAndNumber,
                      onChanged: (_) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      title: 'Last name',
                      isRequired: true,
                      controller: lastName,
                      keyboardType: TextInputType.text,
                      autoValidateMode: AutovalidateMode.disabled,
                      textCapitalization: TextCapitalization.sentences,
                      formatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'([A-Za-z])-?')),
                      ],
                      maxTextLength: 30,
                      validator: Validators.validateLastNameIsEmptyWithLengthAndNumber,
                      onChanged: (_) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      title: 'Email',
                      isRequired: true,
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      autoValidateMode: AutovalidateMode.disabled,
                      validator: Validators.isEmailStr,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 10),
                    CustomPhoneField(
                      controller: phone,
                      title: 'Mobile number',
                      isRequired: true,
                      initialCountryCode: 'NG',
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      title: 'Password',
                      isRequired: true,
                      obscureText: true,
                      focusNode: _focusNode,
                      controller: password,
                      validator: null, //Validators.validateSignUpPassword,
                      errorText: null,
                      onChanged: onPasswordChanged,
                    ),
                    Visibility(
                      visible: _isOverLayVisible,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: CustomColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: _isPasswordEightCharacters ? Colors.green : Colors.transparent,
                                      border: _isPasswordEightCharacters
                                          ? Border.all(color: Colors.transparent)
                                          : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Contains at least 8 characters",
                                  style: CustomTextStyle.textStyleRegular.copyWith(
                                    color: CustomColors.primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: _hasPasswordOneNumber ? Colors.green : Colors.transparent,
                                      border: _hasPasswordOneNumber
                                          ? Border.all(color: Colors.transparent)
                                          : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Contains at least one number",
                                  style: CustomTextStyle.textStyleRegular.copyWith(
                                    color: CustomColors.primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: _hasUppercaseLetter ? Colors.green : Colors.transparent,
                                      border: _hasUppercaseLetter
                                          ? Border.all(color: Colors.transparent)
                                          : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Contains at least one uppercase letter",
                                  style: CustomTextStyle.textStyleRegular.copyWith(
                                    color: CustomColors.primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: _hasSpecialCharacter ? Colors.green : Colors.transparent,
                                      border: _hasSpecialCharacter
                                          ? Border.all(color: Colors.transparent)
                                          : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Contains a special character",
                                  style: CustomTextStyle.textStyleRegular.copyWith(
                                    color: CustomColors.primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: _hasLowercaseLetter ? Colors.green : Colors.transparent,
                                      border: _hasLowercaseLetter
                                          ? Border.all(color: Colors.transparent)
                                          : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Contains at least one lowercase letter",
                                  style: CustomTextStyle.textStyleRegular.copyWith(
                                    color: CustomColors.primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      title: 'Repeat Password',
                      isRequired: true,
                      obscureText: true,
                      controller: confirmPassword,
                      autoValidateMode: AutovalidateMode.disabled,
                      validator: (value) {
                        if (value != password.text) {
                          return "Password does not match";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        //check box to agree to terms and conditions
                        SizedBox(
                          height: 18.h,
                          width: 18.w,
                          child: Checkbox(
                            side: const BorderSide(
                              color: CustomColors.textFieldTitleColor,
                              width: 1.0,
                            ),
                            value: _checkBoxValue,
                            onChanged: (value) {
                              setState(() {
                                _checkBoxValue = value!;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.w),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "By signing up I have read and agree to the",
                              style: CustomTextStyle.textStyleSubRegular.copyWith(
                                color: CustomColors.textFieldTitleColor,
                              ),
                            ),
                            TextSpan(
                                text: "\nTerms & Conditions",
                                style: CustomTextStyle.textStyleSubRegular.copyWith(
                                  color: CustomColors.primaryColorAccent,
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    // const docUrl =
                                    //     'https://drive.google.com/file/d/1g6M-UGcRb5D7CViR9e0JQPf3--YqSB0D/view?usp=drivesdk';
                                    // final url = Uri.parse("$docUrl");
                                    // if (!await launchUrl(url)) {
                                    //   throw 'Could not launch $url';
                                    // }
                                  }),
                          ]),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    PrimaryButton(
                      text: 'Submit',
                      isLoading: false,
                      onPressed: (firstName.text.isEmpty ||
                              lastName.text.isEmpty ||
                              email.text.isEmpty ||
                              phone.text.isEmpty ||
                              password.text.isEmpty ||
                              confirmPassword.text.isEmpty ||
                              _hasUppercaseLetter == false ||
                              _hasSpecialCharacter == false ||
                              _hasLowercaseLetter == false)
                          ? null
                          : () {
                              // final signUpRequest = SignUpRequest(
                              //   title: _selectedType,
                              //   firstName: firstName.text.trim(),
                              //   lastName: lastName.text.trim(),
                              //   emailAddress: email.text.trim(),
                              //   mobileNumber: phone.text.trim(),
                              //   password: password.text.trim(),
                              //   confirmPassword: confirmPassword.text.trim(),
                              // );
                              //
                              // if (_formKey.currentState!.validate()) {
                              //   if (_checkBoxValue == false) {
                              //     showSnackBar('please accept the T & Cs to continue', false);
                              //   } else {
                              //     ref.read(authProvider.notifier).signUp(signUpRequest);
                              //   }
                              // }
                            },
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
