import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/my_Colors.dart';
import 'package:tec/my_Strings.dart';
import 'package:tec/my_Component.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: Assets.images.avatar.provider(),
              height: 90,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  Assets.icons.bluepen.provider(),
                  color: solidColors.seeMore,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  myStrings.imageProfileEdit,
                  style: textTheme.headline5,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              "فاطمه امیری",
              style: textTheme.headline6,
            ),
            Text(
              "fatemeamiri@fmail.com",
              style: textTheme.headline6,
            ),
            SizedBox(
              height: 40,
            ),
            techDivider(size: size),
            InkWell(
              onTap: (() {
                //ی چیزی اجرا بشه
              }),
              splashColor: solidColors.colorPrimary,
              child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      myStrings.myFavText,
                      style: textTheme.headline6,
                    ),
                  )),
            ),
            techDivider(size: size),
            InkWell(
              onTap: (() {
                //ی چیزی اجرا بشه
              }),
              splashColor: solidColors.colorPrimary,
              child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      myStrings.myFavPodcast,
                      style: textTheme.headline6,
                    ),
                  )),
            ),
            techDivider(size: size),
            InkWell(
              onTap: (() {
                //ی چیزی اجرا بشه
              }),
              splashColor: solidColors.colorPrimary,
              child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      myStrings.logOut,
                      style: textTheme.headline6,
                    ),
                  )),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ));
  }
}
