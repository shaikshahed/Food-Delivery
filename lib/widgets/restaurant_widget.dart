import 'package:engro_food/constants/color_constants.dart';
import 'package:flutter/material.dart';

class RestaurantWidget extends StatefulWidget {
  final String imgSrc;
  final String title;
  final String subtitle;
  final String rating;
  final String delivery;
  final String time;
  const RestaurantWidget(
      {super.key,
      required this.imgSrc,
      required this.title,
      required this.subtitle,
      required this.rating,
      required this.delivery,
      required this.time});

  @override
  State<RestaurantWidget> createState() => _RestaurantWidgetState();
}

class _RestaurantWidgetState extends State<RestaurantWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              widget.imgSrc,
              fit: BoxFit.cover,
              height: 150,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          Text(
            widget.subtitle,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xffA6AABE),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              // SizedBox(
              //   height: 25,
              //   width: 25,
              //   child: SvgPicture.asset(
              //     "assets/star.svg",
              //     width: 18,
              //     height: 20,
              //   ),
              // ),
              const Icon(
                Icons.star_border_outlined,
                color: appPrimaryColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.rating,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.delivery_dining_outlined,
                color: appPrimaryColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.delivery,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.access_time_outlined,
                color: appPrimaryColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.time,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
