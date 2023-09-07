import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synkrama_task/Screens/main_screen.dart';
import 'package:synkrama_task/Screens/signup_screen.dart';

import '../Utils/colors.dart';
import '../widgets/customTextField.dart';
import '../widgets/dialog.dart';
import '../widgets/sizedbox.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 late SharedPreferences logindata;
 late bool newuser;
  @override
  void initState() {
    super.initState();
    already_login();
  }

  // ignore: non_constant_identifier_names
  void already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    }
  }

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
  }

  validateForm() {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter the required fields");
    } else if (!emailController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Invalid email address");
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return ProgressDialog(message: "Processing, Please wait..");
          });
           logindata.setBool('login', false);
                  logindata.setString('email', emailController.text);
      //navigate home
      Future.delayed(Duration(milliseconds: 400), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      });
      Fluttertoast.showToast(msg: "Longin Successfully!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login Here",
                  style: TextStyle(
                      fontSize: 26, color: bColor, fontWeight: FontWeight.bold),
                ),
                height40,
                CustomTextField(
                  controller: emailController,
                  hintText: "Enter your email",
                  lableText: "Email",
                  keyBoardType: TextInputType.emailAddress,
                  maxLength: 30,
                ),
                height20,
                CustomTextField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  lableText: "Password",
                  keyBoardType: TextInputType.visiblePassword,
                  isObsecure: true,
                  maxLength: 16,
                ),
                height40,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: bColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                  onPressed: () {
                    validateForm();
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>CarInfoScreen(),),);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        color: wColor,
                      ),
                    ),
                  ),
                ),
                height12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an Account? ",
                      style: TextStyle(color: gColor),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Text(
                          "Register Here",
                          style: TextStyle(color: bColor),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
