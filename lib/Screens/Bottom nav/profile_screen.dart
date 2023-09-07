import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synkrama_task/Screens/signin_screen.dart';
import 'package:synkrama_task/widgets/sizedbox.dart';

import '../../Utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late SharedPreferences logindata;
  late String email;
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      email = logindata.getString('email')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
              Text("User Profile", style: TextStyle(
                      fontSize: 18,
                      color: bColor,
                    ),),
                    height20,
              CircleAvatar(
                radius: 35,
                backgroundColor: wColor,
                backgroundImage: AssetImage("assets/images/img8.png"),
              ),
              height20,
              Text("Email: $email", style: TextStyle(
                      fontSize: 16,
                      color: gColor,
                    ),),
              height20,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: bColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                onPressed: () {
                  logindata.setBool('login', true);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SigninScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 18,
                      color: wColor,
                    ),
                  ),
                ),
              ),
                  ],
                ),
            ),
          ),
        ));
  }
}
