import 'package:bittaqwa/utils/color_constant.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: 250,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_header_dashboard_morning.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Assalamualaikum',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PoppinsSemiBold',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'Subuh',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'PoppinsSemiBold',
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '04:20 am',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'PoppinsBold',
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: Colors.red,
                  size: 25,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Kabupaten Bogor',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PoppinsMedium',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget cardMenus() {
      return Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: ColorConstant.primary,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'Doa',
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/ic_menu_doa.png',
                    ),
                    Text(
                      'Doa-doa',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PoppinsSemiBold',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 28,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'Zakat',
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/ic_menu_zakat.png',
                    ),
                    Text(
                      'Zakat',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PoppinsSemiBold',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 28,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'Jadwal Sholat',
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/ic_menu_jadwal_sholat.png',
                    ),
                    Text(
                      'Jadwal Sholat',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PoppinsSemiBold',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 28,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'Video Kajian',
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/ic_menu_video_kajian.png',
                    ),
                    Text(
                      'Video Kajian',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PoppinsSemiBold',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget cardInspiration() {
      return Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Inspiration',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'PoppinsSemiBold',
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset(
              'assets/images/img_inspiration_3.jpeg',
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset(
              'assets/images/img_inspiration_5.jpeg',
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [header(), cardMenus(), cardInspiration()],
      ),
    );
  }
}
