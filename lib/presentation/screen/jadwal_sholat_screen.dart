import 'package:bittaqwa/presentation/widget/time.dart';
import 'package:bittaqwa/utils/color_constant.dart';
import 'package:flutter/material.dart';

class JadwalSholatScreen extends StatefulWidget {
  const JadwalSholatScreen({super.key});

  @override
  State<JadwalSholatScreen> createState() => _JadwalSholatScreenState();
}

class _JadwalSholatScreenState extends State<JadwalSholatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primary,
        title: Text(
          'Jadwal Sholat',
          style: TextStyle(
            color: ColorConstant.white,
            fontFamily: 'PoppinsMedium',
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Color(0xffE4F2FD),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg_header_jadwal_sholat.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                SizedBox(
                  height: 44,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Senin, 10 November 2025',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'PoppinsBold',
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: ColorConstant.primary,
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Text(
                      'Jonggol, Bogor',
                      style: TextStyle(
                        fontFamily: 'PoppinsBold',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.symmetric(horizontal: 41, vertical: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Time(
                        pray: 'Subuh',
                        time: '04.05',
                        image: 'assets/images/img_clock.png',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 2,
                        width: double.infinity,
                        color: Color(0xffCBE5DD),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Time(
                        pray: 'Dzhur',
                        time: '11.38',
                        image: 'assets/images/img_clock.png',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 2,
                        width: double.infinity,
                        color: Color(0xffCBE5DD),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Time(
                        pray: 'Subuh',
                        time: '04.05',
                        image: 'assets/images/img_clock.png',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 2,
                        width: double.infinity,
                        color: Color(0xffCBE5DD),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Time(
                        pray: 'Subuh',
                        time: '04.05',
                        image: 'assets/images/img_clock.png',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 2,
                        width: double.infinity,
                        color: Color(0xffCBE5DD),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Time(
                        pray: 'Subuh',
                        time: '04.05',
                        image: 'assets/images/img_clock.png',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 2,
                        width: double.infinity,
                        color: Color(0xffCBE5DD),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
