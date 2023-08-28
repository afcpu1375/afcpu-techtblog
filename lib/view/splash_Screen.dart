
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/view/main_screen.dart';
import 'package:tec/components/my_Colors.dart';

class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _splashScreenState();
}





class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {

    Future.delayed(Duration(seconds: 3)).then((value) {

      Navigator.of(context as BuildContext).pushReplacement(MaterialPageRoute(
          builder: (context)=> MainScreen()));
      
    });


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image(image: Assets.images.splash.provider(),height: 60,),
          SizedBox(height: 32,),
          SpinKitFadingCube(
            color: solidColors.colorPrimary,
            size: 32.0,
          )
            ],
          ),
        ),
      ),
    );
  }
}
