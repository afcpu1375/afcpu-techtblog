import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/data_models.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/components/my_Colors.dart';
import 'package:tec/components/my_Component.dart';
import 'package:tec/components/my_Strings.dart';

class MyCats extends StatefulWidget {
  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  Assets.images.techbot.path,
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  myStrings.successFullRegistration,
                  style: textTheme.headline6,
                ),
                SizedBox(
                  height: 32,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی ",
                      hintStyle: textTheme.headline6),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  myStrings.chooseCats,
                  style: textTheme.headline6,
                ),

                //tagList
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: tagList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2,
                                childAspectRatio: 0.3),
                        itemBuilder: ((context, index) {
                          return InkWell(
                              onTap: (() {
                                setState(() {

                                  selectedTags.add(tagList[index]);
                                });
                              }),
                              child:
                                  MainTags(textTheme: textTheme, index: index));
                        })),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Image.asset(
                  Assets.icons.downCatArrow.path,
                  scale: 3,
                ),


                //selectedTags
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: selectedTags.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2,
                                childAspectRatio: 0.3),
                        itemBuilder: ((context, index) {
                          return Container(
                            height: 60,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                             color: solidColors.surface
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    selectedTags[index].title,
                                    style: textTheme.headline6,
                                  ),
                                  InkWell(
                                    onTap: ((){
                                      setState(() {
                                        if(!selectedTags.contains(tagList[index])){
                                          selectedTags.removeAt(index);
                                        }else{
                                          print("${tagList[index].title} exist");
                                        }

                                      });
                                    }),
                                      child: const Icon(CupertinoIcons.delete,color: Colors.grey,)),
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
