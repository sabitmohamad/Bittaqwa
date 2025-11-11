import 'package:flutter/material.dart';

import '../../utils/color_constant.dart';

class Time extends StatelessWidget {
  final String pray;
  final String time;
  final String image;
  const Time({
    required this.pray,
    required this.time,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          pray,
          style: TextStyle(
            fontFamily: 'PoppinsRegular',
            color: ColorConstant.text,
            fontSize: 16,
          ),
        ),
        Spacer(),
        Text(
          time,
          style: TextStyle(
            fontFamily: 'PoppinsRegular',
            color: ColorConstant.text,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Image.asset(image),
      ],
    );
  }
}
