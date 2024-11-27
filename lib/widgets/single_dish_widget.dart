import 'package:engro_food/constants/color_constants.dart';
import 'package:flutter/material.dart';

class SingleDishWidget extends StatefulWidget {
  final String type;
  final String imgSrc;
  final String title;
  final String subtitle;
  final String price;
  const SingleDishWidget(
      {super.key,
      required this.type,
      required this.imgSrc,
      required this.title,
      required this.subtitle,
      required this.price});

  @override
  State<SingleDishWidget> createState() => _SingleDishWidgetState();
}

class _SingleDishWidgetState extends State<SingleDishWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 165,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 9,
                        offset:
                            const Offset(8, 12), // changes position of shadow
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 55,
                      ),
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.type == "starting"
                                    ? "Starting"
                                    : widget.subtitle,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffA6AABE),
                                ),
                              ),
                              widget.type == "dish"
                                  ? SizedBox(
                                      width: 140,
                                      height: 30,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.price,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: appPrimaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(35)),
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                          widget.type == "starting"
                              ? Text(
                                  widget.price,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 30,
            child: Image.asset(
              widget.imgSrc,
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
