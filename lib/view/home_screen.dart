import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/my_Colors.dart';
import 'package:tec/my_Component.dart';
import 'package:tec/my_Strings.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
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
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              homePagePoster(size: size, textTheme: textTheme),
              const SizedBox(
                height: 16,
              ),
              //tag list
              homePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),

              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                child: Row(
                  children: [
                    ImageIcon(
                      Assets.icons.bluepen.provider(),
                      color: solidColors.seeMore,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      myStrings.viewHotestBlog,
                      style: textTheme.headline4,
                    )
                  ],
                ),
              ),
              seeMoreBlog(size: size, bodyMargin: bodyMargin, textTheme: textTheme),

              const SizedBox(
                height: 12,
              ),
              seeMorePodCast(bodyMargin: bodyMargin, textTheme: textTheme),

              homePagePodcastList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
              const SizedBox(height: 60,)
            ],
          ),
        ),
      ),
    );
  }
}

class homePagePodcastList extends StatelessWidget {
  const homePagePodcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: size.height / 4,
        child: ListView.builder(
            itemCount: podCastModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    right: index == 0 ? bodyMargin : 15),
                child: Column(
                  children: [
                    Container(
                      height: size.height / 5.3,
                      width: size.width / 2.5,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                            image: NetworkImage(
                                podCastModel[index].imageUrl),
                            fit: BoxFit.cover),
                      ),
                      /* foregroundDecoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(16)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: gradiantColors.blogPost)),*/
                    ),
                    SizedBox(
                        child: Text(
                          podCastModel[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: textTheme.bodyMedium,
                        ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class seeMorePodCast extends StatelessWidget {
  const seeMorePodCast({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.mic.provider(),
            color: solidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            myStrings.viewHotestPodCasts,
            style: textTheme.headline4,
          )
        ],
      ),
    );
  }
}

class seeMoreBlog extends StatelessWidget {
  const seeMoreBlog({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          itemCount: blogList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            //blog item
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.5,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(16)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      blogList[index].imageUrl),
                                  fit: BoxFit.cover),
                            ),
                            foregroundDecoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(16)),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors:
                                    gradiantColors.blogPost)),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Text(homePagePosterMap["writer"],
                                    style: textTheme.headline3),
                                Row(
                                  children: [
                                    Text(
                                      homePagePosterMap["view"],
                                      style: textTheme.headline3,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: size.width / 2.5,
                      child: Text(
                        blogList[index].title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ))
                ],
              ),
            );
          }),
    );
  }
}

class homePageTagList extends StatelessWidget {
  const homePageTagList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 8, index == 0 ? bodyMargin : 15, 8),
              child: MainTags(textTheme: textTheme, index: index,),
            );
          })),
    );
  }
}


class homePagePoster extends StatelessWidget {
  const homePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.2,
          height: size.height / 4.2,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image:
                  AssetImage(homePagePosterMap["imageAsset"]),
                  fit: BoxFit.cover)),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: gradiantColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      homePagePosterMap["writer"] +
                          " - " +
                          homePagePosterMap["date"],
                      style: textTheme.headline3),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap["view"],
                        style: textTheme.headline3,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                        size: 16,
                      )
                    ],
                  ),
                ],
              ),
              Text(homePagePosterMap["title"],
                  style: textTheme.headline1),
            ],
          ),
        )
      ],
    );
  }
}
