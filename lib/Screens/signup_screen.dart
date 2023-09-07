import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:synkrama_task/Screens/signin_screen.dart';

import '../Utils/colors.dart';
import '../widgets/customTextField.dart';
import '../widgets/dialog.dart';
import '../widgets/sizedbox.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  validateForm() {
    if (nameController.text.isEmpty &&
        emailController.text.isEmpty &&
        phoneController.text.isEmpty &&
        passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter required fields");
    } else if (!emailController.text.contains("@")) {
    } else if (nameController.text.length < 3) {
      Fluttertoast.showToast(msg: "Name must be atleast 3 characters");
    } else if (!emailController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Invalid email address");
    } else if (phoneController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Phone number is required");
    } else if (passwordController.text.length < 6) {
      Fluttertoast.showToast(msg: "Password must be atleast 6 characters");
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return ProgressDialog(message: "Processing, Please wait..");
          });
      //navigate home
      Future.delayed(Duration(milliseconds: 400), () {
         Navigator.push(context, MaterialPageRoute(builder: (context)=>SigninScreen()));
      });
      Fluttertoast.showToast(msg: "Registrarion Successfully!!");
      //navigate signin
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
          child: Column(
            children: [
              Text(
                "Register Here",
                style: TextStyle(
                    fontSize: 26, color: bColor, fontWeight: FontWeight.bold),
              ),
              height40,
              CustomTextField(
                controller: nameController,
                hintText: "Enter your name",
                lableText: "Name",
                keyBoardType: TextInputType.name,
                maxLength: 30,
              ),
              height20,
              CustomTextField(
                controller: emailController,
                hintText: "Enter your email",
                lableText: "Email",
                keyBoardType: TextInputType.emailAddress,
                maxLength: 30,
              ),
              height20,
              CustomTextField(
                controller: phoneController,
                hintText: "Enter your phone number",
                lableText: "Phone Number",
                keyBoardType: TextInputType.phone,
                maxLength: 10,
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
                  
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 18,
                      color: wColor,
                    ),
                  ),
                ),
              ),
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account?",
                    style: TextStyle(color: gColor),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SigninScreen()));
                      },
                      child: Text(
                        "Login Here",
                        style: TextStyle(color: bColor),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
