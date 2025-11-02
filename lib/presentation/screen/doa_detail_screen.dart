import 'package:dashboard_islami/utils/color_constant.dart';
import 'package:flutter/material.dart';

class DoaDetailScreen extends StatelessWidget {
  final String title;
  final String arabicText;
  final String translation;
  final String reference;
  const DoaDetailScreen({
    required this.title,
    required this.arabicText,
    required this.translation,
    required this.reference,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primary,
        title: Text(
          title,
          style: TextStyle(
            color: ColorConstant.white,
            fontSize: 16,
            fontFamily: 'PoppinsMedium',
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_detail_doa.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: ColorConstant.black,
                      fontFamily: 'PoppinsBold',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    arabicText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorConstant.text,
                      fontFamily: 'PoppinsSemiBold',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    translation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorConstant.prayText,
                      fontFamily: 'PoppinsRegular',
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    reference,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: ColorConstant.text,
                      fontFamily: 'PoppinsRegular',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
