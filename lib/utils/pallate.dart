import 'package:flutter/material.dart'; 
class Palette { 
  static const MaterialColor kToDark =  MaterialColor( 
    0xff000000, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch. 
     <int, Color>{ 
      50:  Color(0xff7a7a7a ),//10% 
      100:  Color(0xff707070),//20% 
      200:  Color(0xff666666),//30% 
      300:  Color(0xff5c5c5c),//40% 
      400:  Color(0xff525252),//50% 
      500:  Color(0xff474747),//60% 
      600:  Color(0xff3d3d3d),//70% 
      700:  Color(0xff333333),//80% 
      800:  Color(0xff1f1f1f),//90% 
      900:  Color(0xff141414),//100% 
    }, 
  ); 
} 