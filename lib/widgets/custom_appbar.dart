import 'package:flutter/material.dart';

import '../constants/image_path.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
              ),
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  ImagePath.avatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
              height: 80,
              width: 110,
              child: Image.asset(
                ImagePath.fixiaBlueLogo,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            width: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
