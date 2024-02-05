import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/responsive.dart';

class ScrollImage extends StatefulWidget {
  ScrollImage({Key? key, required this.data, required this.autoPlay})
      : super(key: key);

  final HouseModel data;
  final bool autoPlay;

  @override
  _ScrollImageState createState() => _ScrollImageState();
}

class _ScrollImageState extends State<ScrollImage> {
  CarouselController carouselController = CarouselController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<dynamic> images = widget.data.url;

    return Center(
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              height: SizeConfig.defaultSize! * 23.5,
              aspectRatio: 0 / 20,
              viewportFraction: 1.2,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: widget.autoPlay,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
            items: images.map((dynamic url) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: CachedNetworkImage(
                      imageUrl: url,
                      placeholder: (context, url) => Center(
                          child: Lottie.asset(AppAssets.Loding,
                              height: SizeConfig.defaultSize! * 9)),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        size: 30,
                      ),
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: DotsIndicator(
              dotsCount: images.length,
              position: currentPage,
              decorator: DotsDecorator(
                activeColor: Colors.blue,
                color: Color.fromARGB(26, 248, 170, 170),
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
