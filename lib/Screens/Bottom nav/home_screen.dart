import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synkrama_task/utils/colors.dart';
import 'package:synkrama_task/widgets/sizedbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
    "assets/images/img5.jpg",
    "assets/images/img6.jpg",
  ];

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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child:
              SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

Row(children: [
  CircleAvatar(
    radius: 25,
    backgroundColor: wColor,
    backgroundImage: AssetImage("assets/images/img8.png"),
  ),
  width12,
  Text(email),
],),
height20,

                          Text("ListView",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                          height12,
                          images.isEmpty
                  ? Center(child: Text("No images Found"))
                  : SizedBox(
                      height: 250,
                      child: ListView.builder(
                        // scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            var data = images[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                constraints: BoxConstraints(
                                  minHeight: 100,
                                  maxHeight: 120,                              ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: AssetImage(data), fit: BoxFit.cover)),
                              ),
                            );
                          }),
                      //  child: ListView(
                      //                physics: const ClampingScrollPhysics(),
                      //                shrinkWrap: true,
                      //                scrollDirection: Axis.horizontal,
                      //                children: images.map((e) => imageContainer(e)).toList(),
                      //              ),
                    ),
                    height20,
                    Text("Gridview",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                    height12,
                  images.isEmpty
                  ? Center(child: Text("No images Found"))
                  :  SizedBox(
                      height: 350,
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 12,mainAxisSpacing: 12),
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: images.length,
                       itemBuilder: (context,index){
                        var data = images[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  constraints: BoxConstraints(
                                    minHeight: 100,
                                    maxHeight: 120,                              ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: AssetImage(data), fit: BoxFit.cover)),
                                ),
                              );
                      }),
                    )
                        ]),
              ),
        ),
      ),
    );
  }

  // Container imageContainer(String img) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8),
  //         image: DecorationImage(image: AssetImage("assets/images/img1.jpg"), fit: BoxFit.cover)),
  //   );
  // }
}
