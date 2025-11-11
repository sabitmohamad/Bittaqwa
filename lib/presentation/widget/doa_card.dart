import 'package:flutter/material.dart';

class DoaCard extends StatelessWidget {
  final String image;
  final String title;
  final Function onTap;

  const DoaCard({required this.image, required this.title, required this.onTap, super.key});

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
              spreadRadius: 10.0,
              blurRadius: 5,
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
                height: 5,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PoppinsMedium'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
