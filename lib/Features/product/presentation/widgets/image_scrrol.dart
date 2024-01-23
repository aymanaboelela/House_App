import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';

import '../../../../core/utils/responsive.dart';

class ScrollImage extends StatefulWidget {
  const ScrollImage({Key? key, required this.data, required this.autoPlay}) : super(key: key);

  final HouseModel data;
 final bool autoPlay;
  @override
  State<ScrollImage> createState() => _ScrollImageState();
}

class _ScrollImageState extends State<ScrollImage> {
  late List<String> images;
  
  @override
  void initState() {
    super.initState();
    // Initialize the images list with the URL from the HouseModel
    images = [
      widget.data.url!,
      widget.data.url!,
      widget.data.url!,
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: SizeConfig.defaultSize! * 23,
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
        ),
        items: images.map((String url) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CachedNetworkImage(
                    imageUrl: url,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.fill,
                  ));
            },
          );
        }).toList(),
      ),
    );
  }
}
