
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synkrama_task/Screens/Bottom%20nav/home_screen.dart';
import 'package:synkrama_task/Screens/Bottom%20nav/order_screen.dart';
import 'package:synkrama_task/Screens/Bottom%20nav/profile_screen.dart';

import '../Utils/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

late  SharedPreferences logindata;
 late String email;
 
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      email = logindata.getString('email')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          OrderScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: "Home"),
         BottomNavigationBarItem(icon: Icon(Icons.toc_outlined),
        label: "Order"),
         
         BottomNavigationBarItem(icon: Icon(Icons.person),
        label: "Profile"),
      ],
      unselectedItemColor: gColor.withOpacity(0.5),
      selectedItemColor: wColor,
      backgroundColor: bColor,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: 14
      ),
      showUnselectedLabels: true,
      currentIndex: selectedIndex,
      onTap: onItemClicked,
      ),
    );
  }
}
