import 'package:flutter/material.dart';

class CardDoa extends StatelessWidget {
  final String image;
  final String title;
  final Function onTap;
  const CardDoa({
    required this.image,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              blurRadius: 10.0,
              spreadRadius: 5.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PoppinsMedium',
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
