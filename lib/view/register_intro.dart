import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/components/my_Strings.dart';
import 'package:tec/view/my_cats.dart';
import 'package:validators/validators.dart';


class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.techbot.path,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: myStrings.welcom, style: textTheme.headline6)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: (() {

                  _showEmailBottomSheet(context, size, textTheme);
                }),
                child: const Text("بزن بریم"),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<dynamic> _showEmailBottomSheet(BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: size.height / 2,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(myStrings.insertYourEmail,style: textTheme.headline6,),
                                Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: TextField(
                                    onChanged: (value){
                                          print(value + "is Email : " + isEmail(value).toString());
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: "techblog@gmail.com",
                                      hintStyle: textTheme.headline4
                                    ),
                                  ),
                                ),
                                ElevatedButton(onPressed: ((){
                                  Navigator.pop(context);
                                  _activateCodeBottomSheet(context, size, textTheme);
                                }),
                                    child: const Text("ادامه"))
                              ],
                            ),
                          ),
                        ),
                      );
                    });
  }







  Future<dynamic> _activateCodeBottomSheet(BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: size.height / 2,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(myStrings.activateCode ,style: textTheme.headline6,),
                                Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: TextField(
                                    onChanged: (value){
                                          print(value + "is Email : " + isEmail(value).toString());
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: "******",
                                      hintStyle: textTheme.headline4
                                    ),
                                  ),
                                ),
                                ElevatedButton(onPressed: ((){

                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyCats()));


                                }),
                                    child: const Text("ادامه"))
                              ],
                            ),
                          ),
                        ),
                      );
                    });
  }
}
