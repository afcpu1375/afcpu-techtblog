import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tec/components/api_constant.dart';
import 'package:tec/components/my_Component.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/components/my_Colors.dart';
import 'package:tec/components/my_Strings.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/view/home_screen.dart';
import 'package:tec/view/main_screen.dart';
import 'package:tec/view/profile_screen.dart';

class MainScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  RxInt selectedPageIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    
    
    DioService().getMethod(ApiConstant.getHomeItems);
    var textTheme = Theme.of(context).textTheme;

    var size = MediaQuery.of(context).size;

    double bodyMargin = size.width / 10;

    // TODO: implement build
    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: solidColors.scafoldBg,
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: ListView(
            children: [
              DrawerHeader(
                  child: Center(
                      child: Image.asset(
                Assets.images.splash.path,
                scale: 3,
              ))),
              ListTile(
                title: Text(
                  "پروفایل کاربری",
                  style: textTheme.headline6,
                ),
                onTap: () {},
              ),
              const Divider(
                color: solidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  "درباره تک بلاگ",
                  style: textTheme.headline6,
                ),
                onTap: () {},
              ),
              Divider(
                color: solidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  "اشتراک گذاری تک بلاگ",
                  style: textTheme.headline6,
                ),
                onTap: () async {

                      await Share.share("this is for test");
                },
              ),
              Divider(
                color: solidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  "تک بلاگ در گیت هاب",
                  style: textTheme.headline6,
                ),
                onTap: () {
                  mylaunchUrl(myStrings.urlGitHub);
                },
              ),
              Divider(
                color: solidColors.dividerColor,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: solidColors.scafoldBg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (() {
                _key.currentState!.openDrawer();
              }),
              child: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            Image(
              image: Assets.images.splash.provider(),
              height: size.height / 13.6,
            ),
            Icon(Icons.search, color: Colors.black),
          ],
        ),
      ),
      body: Stack(
        children: [
          Center(
              child: Positioned.fill(
                  child: Obx(() => IndexedStack(
                        index: selectedPageIndex.value,
                        children: [
                          homeScreen(
                              size: size,
                              textTheme: textTheme,
                              bodyMargin: bodyMargin),
                          //0
                          profileScreen(
                              size: size,
                              textTheme: textTheme,
                              bodyMargin: bodyMargin)
                          //1
                        ],
                      )))),
          bottomNavigation(
            size: size,
            bodyMargin: bodyMargin,
            changeScreen: (int value) {
              selectedPageIndex.value = value;
            },
          ),
        ],
      ),
    );
  }
}

class bottomNavigation extends StatelessWidget {
  const bottomNavigation({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: gradiantColors.bottomNavBackground,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding:
              EdgeInsets.only(right: bodyMargin, left: bodyMargin, bottom: 20),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(colors: gradiantColors.bottomNav)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: (() {
                      changeScreen(0);
                    }),
                    icon: ImageIcon(
                      Assets.icons.home.provider(),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: (() {}),
                    icon: ImageIcon(
                      Assets.icons.write.provider(),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: (() {
                      changeScreen(1);
                    }),
                    icon: ImageIcon(
                      Assets.icons.user.provider(),
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
