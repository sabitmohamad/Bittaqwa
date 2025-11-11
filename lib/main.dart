import 'package:bittaqwa/presentation/screen/dashboard_screen.dart';
import 'package:bittaqwa/presentation/screen/doa_screen.dart';
import 'package:bittaqwa/presentation/screen/jadwal_sholat_screen.dart';
import 'package:bittaqwa/presentation/screen/video_kajian_screen.dart';
import 'package:bittaqwa/presentation/screen/zakat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/': (context) => DashboardScreen(),
        'Doa': (context) => DoaScreen(),
        'Zakat': (context) => ZakatScreen(),
        'Jadwal Sholat': (context) => JadwalSholatScreen(),
        'Video Kajian': (context) => VideoKajianScreen(),
      },
    );
  }
}
