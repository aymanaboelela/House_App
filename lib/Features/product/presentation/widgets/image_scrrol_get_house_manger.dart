import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:house_app_one/Features/product/presentation/widgets/image_scrrol.dart';
import 'package:house_app_one/core/thems/app/app_colors.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/assets.dart';
import '../../../admin/add-house_manger/data/models/get_house_mangers_model/get_house_mangers_model.dart';


class ScrollImageGethousemanger extends StatefulWidget {
  const ScrollImageGethousemanger({super.key, required this.data, required this.autoPlay});
  final HouseMangerModel data;
  final bool autoPlay;


  @override
  State<ScrollImageGethousemanger> createState() => _ScrollImageGethousemangerState();
}
  CarouselController carouselController = CarouselController();

class _ScrollImageGethousemangerState extends State<ScrollImageGethousemanger> {
  int currentPage = 0;
  @override

  Widget build(BuildContext context) {
    List<dynamic> images = widget.data.imageUrls!;
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
                color: AppColors.KPrimeColor,
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