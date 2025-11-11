import 'package:flutter/material.dart';

class CardResultHarta extends StatelessWidget {
  final String title;
  final String result;
  final Color color;

  const CardResultHarta({
    required this.title,
    required this.result,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'PoppinsMedium',
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            result,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'PoppinsMedium',
            ),
          ),
        ],
      ),
    );
  }
}
