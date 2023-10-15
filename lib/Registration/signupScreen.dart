import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:sharespace/Registration/loginScreen.dart';
import '../ReusableWidgets/button.dart';
import '../ReusableWidgets/iconsRow.dart';
import '../ReusableWidgets/textFields.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  TextEditingController verificationTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            /*Container(
              height: size.height * 0.25,
              width: size.width,
              child:
              Stack(
                children: [
                  Image.asset(
                    //'assets/sharespace-white.png',
                    'assets/background.jpg',
                    width: size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: size.height*0.1),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/sharespacevid-white.gif',
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),*/
            Container(
              height: size.height * 0.25,
              width: size.width,
              //color: Colors.teal,
              child: Image.asset(
                'assets/signupbg.gif',
                //height: 250,
                //width: 250,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: size.height * 0.15,
              ),
              constraints: BoxConstraints(
                minHeight: size.height * 0.85,
              ),
              //height: size.height * 0.85,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0), // Adjust the radius as needed
                  topRight:
                      Radius.circular(50.0), // Adjust the radius as needed
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    const Text(
                      'Hello!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    buildTextField(
                      false,
                      'Name',
                      usernameTextEditingController,
                      Icon(
                        Icons.person,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      IconButton(
                        icon: const Icon(null),
                        onPressed: () {},
                      ),
                      TextInputType.name,
                      false,
                      (value) {
                        if (!validator.name(value!)) {
                          /*displayErrorMotionToast(
                            context,
                            'Please enter valid name',
                          );*/
                          return 'Please enter valid name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    buildTextField(
                      false,
                      'Email',
                      emailTextEditingController,
                      Icon(
                        Icons.email,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      IconButton(
                        icon: const Icon(null),
                        onPressed: () {},
                      ),
                      TextInputType.emailAddress,
                      false,
                      (value) {
                        if (!validator.email(value!)) {
                          /*displayErrorMotionToast(
                            context,
                            'Please enter valid email',
                          );*/
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    buildTextField(
                      isPasswordVisible,
                      'Password',
                      passwordTextEditingController,
                      Icon(
                        Icons.lock,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      TextInputType.visiblePassword,
                      true,
                      (value) {
                        if (!validator.mediumPassword(value!)) {
                          /*displayErrorMotionToast(
                            context,
                            'Password must have following:\n1. Minimum length of 6 characters.\n2. At least one lowercase letter.\n3. At least one uppercase letter.\n4. At least one digit.',
                          );*/
                          return 'Password must have following:\n1. Minimum length of 6 characters.\n2. At least one lowercase letter.\n3. At least one uppercase letter.\n4. At least one digit.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    buildTextField(
                      isConfirmPasswordVisible,
                      'Confirm Password',
                      confirmPasswordTextEditingController,
                      Icon(
                        Icons.lock,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isConfirmPasswordVisible =
                                !isConfirmPasswordVisible;
                          });
                        },
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      TextInputType.visiblePassword,
                      true,
                      (value) {
                        if (value!.isEmpty ||
                            value != passwordTextEditingController.text) {
                          /*displayErrorMotionToast(
                            context,
                            "Confirm password didn't matched!",
                          );*/
                          return "Confirm password didn't matched!";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number);
                      },
                      selectorConfig: const SelectorConfig(
                        leadingPadding: 12.5,
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                        trailingSpace: false,
                        setSelectorButtonAsPrefixIcon: true,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      textFieldController: phoneNumberTextEditingController,
                      formatInput: false,
                      maxLength: 10,
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: true,
                        decimal: true,
                      ),
                      cursorColor: Colors.black,
                      inputDecoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          "I agree to all the ",
                          style: TextStyle(
                            //color: Colors.grey,
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Terms & Condition',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    SizedBox(
                      width: size.width * 1,
                      height: 50,
                      child: buildButton(
                        'Sign Up',
                        context,
                        () {
                          /*if (formKey.currentState!.validate()) {
                            //formKey.currentState?.save();
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return const BottomSheetWidget();
                              },
                            );
                          } else {
                            null;
                            */ /*displayErrorMotionToast(
                                context, 'Please enter the details correctly.');*/ /*
                          }*/
                          showModalBottomSheet(
                            isScrollControlled: true,
                            constraints: BoxConstraints(
                              minHeight: size.height * 0.6,
                              //maxHeight: size.height * 0.6,
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return const BottomSheetWidget();
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    buildORRow(
                      Colors.black.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    SizedBox(
                      width: size.width,
                      height: 50,
                      child: buildIconsRow(size, () {}),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?  ",
                          style: TextStyle(
                            //color: Colors.grey,
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              const LoginScreen(),
                            );
                            /*Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );*/
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Verify your phone number',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Text(
              'Enter the verification code we just sent to your phone number',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Align(
              alignment: Alignment.center,
              child: VerificationCode(
                textStyle: const TextStyle(
                  fontSize: 20.0,
                ),
                fullBorder: true,
                keyboardType: TextInputType.number,
                length: 6,
                onCompleted: (String value) {
                  print('onCompleted: $value');
                  /*setState(() {
                                            _code = value;
                                          });*/
                },
                onEditing: (bool value) {
                  print('onEditing: $value');
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            SizedBox(
              width: size.width,
              child: buildButton(
                'Verify',
                context,
                () => () {},
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive any code? ",
                  style: TextStyle(
                    //color: Colors.grey,
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Resend',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      /*decoration: TextDecoration.underline,
                                                decorationColor: Colors.black,
                                                decorationThickness: 1.0,*/
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
