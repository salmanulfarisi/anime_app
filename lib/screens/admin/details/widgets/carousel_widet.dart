import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

Widget carousalWidget({context, data, controller}) {
  final size = MediaQuery.of(context).size;
  return Column(
    children: [
      CarouselSlider.builder(
        itemCount: data['animeImage'].length,
        itemBuilder: (context, index, realIndex) {
          return CachedNetworkImage(
            imageUrl: "${data['animeImage'][index]}",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            placeholder: (context, url) => VxShimmer(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // child: Container(
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //     image: NetworkImage("${data['posterImg'][index]}"),
            //     fit: BoxFit.cover,
            //   )),
            // ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          height: size.height * 0.30,
          viewportFraction: 1,
          enableInfiniteScroll: false,
          initialPage: 0,
          onPageChanged: (index, reason) {
            controller.currentIndex.value = index;
          },
        ),
      ),
      10.heightBox,
      Obx(
        () => AnimatedSmoothIndicator(
          activeIndex: controller.currentIndex.value,
          count: data['animeImage'].length,
          effect: const ExpandingDotsEffect(
            activeDotColor: Color(0xff06c149),
            dotHeight: 6,
            dotWidth: 6,
            radius: 12,
            dotColor: Color(0xffe0e0e0),
          ),
        ),
      )
    ],
  );
}
