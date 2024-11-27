import 'package:engro_food/constants/color_constants.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatefulWidget {
  final String address;
  final String type;
  const AddressWidget({super.key, required this.address, required this.type});

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
          color: appFieldsColor,
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(35)),
            child: IconButton(
              icon: () {
                if (widget.type == "home") {
                  return Image.asset(
                    "assets/home.png",
                    fit: BoxFit.cover,
                    height: 25,
                    width: 25,
                  );
                } else if (widget.type == "work") {
                  return Image.asset(
                    "assets/briefcase.png",
                    fit: BoxFit.cover,
                    height: 25,
                    width: 25,
                  );
                } else {
                  return Image.asset(
                    "assets/skyline.png",
                    fit: BoxFit.cover,
                    height: 25,
                    width: 25,
                  );
                }
              }(),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 145,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    () {
                      if (widget.type == "home") {
                        return Text(
                          "home".toUpperCase(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        );
                      } else if (widget.type == "work") {
                        return Text(
                          "work".toUpperCase(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        );
                      } else {
                        return Text(
                          "others".toUpperCase(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        );
                      }
                    }(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          color: appPrimaryColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.delete_outline,
                          color: appPrimaryColor,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  widget.address,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff91959C)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
