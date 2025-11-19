import 'package:bittaqwa/presentation/widget/time.dart';
import 'package:bittaqwa/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/date_symbol_data_local.dart';

class JadwalSholatScreen extends StatefulWidget {
  const JadwalSholatScreen({super.key});

  @override
  State<JadwalSholatScreen> createState() => _JadwalSholatScreenState();
}

class _JadwalSholatScreenState extends State<JadwalSholatScreen> {
  List<dynamic>? _jadwalSholat;
  String? _locationName;
  bool _isLoading = true;

  Future<List<dynamic>> fetchJadwalSholat(
    String city,
    String month,
    String year,
  ) async {
    final url =
        'https://api.aladhan.com/v1/calendarByCity?city=$city&country=Indonesia&method=11&month=$month&year=$year';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      return decoded["data"];
    } else {
      throw Exception("Failed to load jadwal sholat");
    }
  }

  @override
  void initState() {
    super.initState();

    initializeDateFormatting('id_ID', null).then((_) {
      _fetchLocationAndJadwalSholat();
    });
  }

  Future<void> _fetchLocationAndJadwalSholat() async {
    try {
      var status = await Permission.location.request();

      String city = "Bogor"; // Default

      if (status.isGranted) {
        try {
          Position position = await Geolocator.getCurrentPosition();

          List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude,
            position.longitude,
          );

          city = placemarks.first.subAdministrativeArea ?? "Bogor";
        } catch (_) {
          // Gagal ambil lokasi → pakai default
          city = "Bogor";
        }
      }

      final now = DateTime.now();
      String month = DateFormat('MM').format(now);
      String year = DateFormat('yyyy').format(now);

      List<dynamic> jadwal = await fetchJadwalSholat(city, month, year);

      setState(() {
        _jadwalSholat = jadwal;
        _locationName = city;
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching location or jadwal sholat: $e");

      setState(() {
        _isLoading = false;
        _jadwalSholat = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primary,
        title: Text(
          'Jadwal Sholat',
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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _jadwalSholat == null
          ? const Center(child: Text("Failed to load jadwal sholat"))
          : Container(
              color: Colors.blue[50],
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/bg_header_jadwal_sholat.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),

                  Column(
                    children: [
                      const SizedBox(height: 48),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          DateFormat(
                            'EEEE, d MMMM yyyy',
                            'id_ID',
                          ).format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "PoppinsSemiBold",
                            color: ColorConstant.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            size: 14,
                            color: ColorConstant.primary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            _locationName ?? "Mengambil lokasi...",
                            style: TextStyle(
                              color: ColorConstant.white,
                              fontFamily: 'PoppinsRegular',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 48),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorConstant.white,
                        ),
                        child: Column(
                          children: [
                            Time(
                              pray: "Subuh",
                              time: _jadwalSholat![0]["timings"]["Fajr"] ?? "N/A",
                              image: "assets/images/img_clock.png",
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: const Color(0xffC5E6DB),
                            ),
                            const SizedBox(height: 16),
                            Time(
                              pray: "Dzuhur",
                              time: _jadwalSholat![0]["timings"]["Dhuhr"] ?? "N/A",
                              image: "assets/images/img_clock.png",
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: const Color(0xffC5E6DB),
                            ),
                            const SizedBox(height: 16),
                            Time(
                              pray: "Ashar",
                              time: _jadwalSholat![0]["timings"]["Asr"] ?? "N/A",
                              image: "assets/images/img_clock.png",
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: const Color(0xffC5E6DB),
                            ),
                            const SizedBox(height: 16),
                            Time(
                              pray: "Maghrib",
                              time: _jadwalSholat![0]["timings"]["Maghrib"] ?? "N/A",
                              image: "assets/images/img_clock.png",
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: const Color(0xffC5E6DB),
                            ),
                            const SizedBox(height: 16),
                            Time(
                              pray: "Isya",
                              time: _jadwalSholat![0]["timings"]["Isha"] ?? "N/A",
                              image: "assets/images/img_clock.png",
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
