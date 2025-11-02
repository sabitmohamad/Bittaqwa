import 'package:dashboard_islami/presentation/screen/dashboard_screen.dart';
import 'package:dashboard_islami/presentation/screen/doa_screen.dart';
import 'package:dashboard_islami/presentation/screen/dzikir_screen.dart';
import 'package:dashboard_islami/presentation/screen/jadwal_sholat_screen.dart';
import 'package:dashboard_islami/presentation/screen/video_kajian_screen.dart';
import 'package:dashboard_islami/presentation/screen/zakat_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting(
    'id_ID',
    null,
  );
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
        '/': (context) => const DashboardScreen(),
        'doa': (context) => const DoaScreen(),
        'zakat': (context) => const ZakatScreen(),
        'jadwal sholat': (context) => const JadwalSholatScreen(),
        'video kajian': (context) => const VideoKajianScreen(),
        'dzikir': (context) => const DzikirScreen(),
      },
    );
  }
}
