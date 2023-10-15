import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:sharespace/ReusableWidgets/button.dart';
import 'package:sharespace/ReusableWidgets/textFields.dart';

import '../ReusableWidgets/motionToast.dart';
import 'loginScreen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'FORGET PASSWORD',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Padding(
                padding: const EdgeInsets.all(35),
                child: Text(
                  'Please enter your email address below to receive a link for resetting your password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              buildTextField(
                false,
                'Email',
                emailTextEditingController,
                Icon(
                  Icons.person,
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
                      'Please enter a valid email',
                    );*/
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              SizedBox(
                width: size.width * 1,
                height: 50,
                child: buildButton(
                  'Submit',
                  context,
                  () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState?.save();
                    } else {
                      null;
                      /*displayErrorMotionToast(
                          context, 'Please enter the details correctly.');*/
                    }
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Back to  ",
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
                    },
                    child: const Text(
                      "Login",
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
    );
  }
}
