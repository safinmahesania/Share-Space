import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:sharespace/Firebase/Authentication/firebaseAuth.dart';
import 'package:sharespace/Registration/forgetPasswordScreen.dart';
import 'package:sharespace/Registration/signupScreen.dart';
import 'package:sharespace/ReusableWidgets/button.dart';
import 'package:sharespace/ReusableWidgets/motionToast.dart';
import 'package:sharespace/homeScreen.dart';
import '../ReusableWidgets/iconsRow.dart';
import '../ReusableWidgets/textFields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.4,
              width: size.width,
              /*constraints: BoxConstraints(
                minHeight: size.height * 0.4,
              ),*/
              child: Image.asset(
                'assets/loginbg.jpg',
                //height: 500,
                fit: BoxFit.cover,
              ),
              /*Stack(
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
                      'assets/sharespace-white-nobg.png',
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),*/
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.3),
              //height: size.height*0.8,
              constraints: BoxConstraints(
                minHeight: size.height * 0.7,
              ),
              width: size.width,
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
                      height: size.height * 0.05,
                    ),
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
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
                      false,
                      (value) {
                        if (!validator.password(value!)) {
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
                      height: size.height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const ForgetPasswordScreen(),
                            );
                          },
                          child: Text(
                            'Forget Password?',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SizedBox(
                      width: size.width * 1,
                      height: 50,
                      child: buildButton(
                        'Sign In',
                        context,
                        () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState?.save();
                            AuthService().signInWithEmailPassword(
                                emailTextEditingController.text,
                                passwordTextEditingController.text);
                            Get.to(HomeScreen());
                          } else {
                            null;
                            displayErrorMotionToast(
                                context, 'Please enter the details correctly.');
                          }
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
                      child: buildIconsRow(
                        size,
                        () => AuthService().signInWithGoogle(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account  ",
                          style: TextStyle(
                            //color: Colors.grey,
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              const SignupScreen(),
                            );
                          },
                          child: const Text(
                            "Sign Up",
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

/*@override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: size.height * 0.3,
              color: Colors.teal,
              child: Image.asset(
                'assets/sharespace-white.png',
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              //height: size.height*0.8,
              constraints: BoxConstraints(
                minHeight: size.height * 0.7,
              ),
              width: size.width,
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
                      height: size.height * 0.05,
                    ),
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
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
                          */ /*displayErrorMotionToast(
                            context,
                            'Please enter a valid email',
                          );*/ /*
                          return 'Please enter a valid email';
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
                      false,
                      (value) {
                        if (!validator.password(value!)) {
                          */ /*displayErrorMotionToast(
                            context,
                            'Password must have following:\n1. Minimum length of 6 characters.\n2. At least one lowercase letter.\n3. At least one uppercase letter.\n4. At least one digit.',
                          );*/ /*
                          return 'Password must have following:\n1. Minimum length of 6 characters.\n2. At least one lowercase letter.\n3. At least one uppercase letter.\n4. At least one digit.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const ForgetPasswordScreen(),
                            );
                          },
                          child: Text(
                            'Forget Password?',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SizedBox(
                      width: size.width * 1,
                      height: 50,
                      child: buildButton(
                        'Sign In',
                        context,
                        () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState?.save();
                          } else {
                            null;
                            displayErrorMotionToast(
                                context, 'Please enter the details correctly.');
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    buildORRow(
                      Colors.black.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: buildIconsRow(() {}, () {}),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account  ",
                          style: TextStyle(
                            //color: Colors.grey,
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              const SignupScreen(),
                            );
                          },
                          child: const Text(
                            "Sign Up",
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
  }*/
}
