import 'package:dashboard_islami/presentation/screen/doa_list_screen.dart';
import 'package:dashboard_islami/presentation/widgets/card_doa.dart';
import 'package:dashboard_islami/utils/color_constant.dart';
import 'package:flutter/material.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primary,
        title: Text(
          'Doa - doa',
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
      body: Column(
        children: [
          Image.asset(
            width: double.infinity,
            'assets/images/bg_header_doa.png',
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 24,
                crossAxisSpacing: 12,
                children: [
                  CardDoa(
                    image: 'assets/images/ic_doa_pagi_malam.png',
                    title: 'Pagi & Malam',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoaListScreen(
                            category: 'Pagi & Malam',
                          ),
                        ),
                      );
                    },
                  ),
                  CardDoa(
                    image: 'assets/images/ic_doa_rumah.png',
                    title: 'Rumah',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoaListScreen(
                            category: 'Rumah',
                          ),
                        ),
                      );
                    },
                  ),
                  CardDoa(
                    image: 'assets/images/ic_doa_makanan_minuman.png',
                    title: 'Makanan & Minuman',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoaListScreen(
                            category: 'Makanan & Minuman',
                          ),
                        ),
                      );
                    },
                  ),
                  CardDoa(
                    image: 'assets/images/ic_doa_perjalanan.png',
                    title: 'Perjalanan',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoaListScreen(
                            category: 'Perjalanan',
                          ),
                        ),
                      );
                    },
                  ),
                  CardDoa(
                    image: 'assets/images/ic_doa_sholat.png',
                    title: 'Sholat',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoaListScreen(
                            category: 'Sholat',
                          ),
                        ),
                      );
                    },
                  ),
                  CardDoa(
                    image: 'assets/images/ic_doa_etika_baik.png',
                    title: 'Etika Baik',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoaListScreen(
                            category: 'Etika Baik',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
