import 'package:dashboard_islami/presentation/widgets/card_result_harta.dart';
import 'package:dashboard_islami/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'package:intl/intl.dart';

class ZakatScreen extends StatefulWidget {
  const ZakatScreen({super.key});

  @override
  State<ZakatScreen> createState() => _ZakatScreenState();
}

class _ZakatScreenState extends State<ZakatScreen> {
  final MoneyMaskedTextController controller = MoneyMaskedTextController(
    thousandSeparator: '.',
    precision: 0,
    decimalSeparator: '',
  );

  double totalHarta = 0;
  double zakatDikeluarkan = 0;
  final double minimumHarta = 85000000;

  String formattedTotalHarta = '';
  String formattedZakatDikeluarkan = '';

  void hitungZakat() {
    String cleanValue = controller.text.replaceAll('.', '');
    double inputValue = double.tryParse(cleanValue) ?? 0;

    if (inputValue >= minimumHarta) {
      setState(() {
        totalHarta = inputValue;
        zakatDikeluarkan = (inputValue * 2.5) / 100;
      });

      formattedTotalHarta = NumberFormat.currency(
        locale: 'id_ID',
        symbol: '',
      ).format(totalHarta);

      formattedZakatDikeluarkan = NumberFormat.currency(
        locale: 'id_ID',
        symbol: '',
      ).format(zakatDikeluarkan);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Peringatan'),
          content: Text(
            'Total harta belum mencapai Hisab (85 gram emas)',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget cardHarta() {
      return Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Harta',
              style: TextStyle(
                color: ColorConstant.primary,
                fontFamily: 'PoppinsMedium',
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // gunakan label + hint agar tetap muncul di awal
                labelText: 'Total Harta',
                hintText: 'Masukkan total harta Anda',
                labelStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
                hintStyle: const TextStyle(
                  color: Colors.black38,
                  fontSize: 13,
                ),
                fillColor: Colors.white,
                filled: true,
                prefixText: 'Rp. ',
                prefixStyle: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: ColorConstant.primary,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: ColorConstant.primary,
                    width: 2.0,
                  ),
                ),
              ),
              onTap: () {
                if (controller.text == '0') {
                  controller.text = ''; // kosongkan ketika user mulai mengetik
                }
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus(); // menutup keyboard
                hitungZakat();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstant.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                minimumSize: const Size(double.infinity, 40),
              ),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PoppinsMedium',
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget cardResult(
      String formattedTotalHarta,
      String formattedZakatDikeluarkan,
    ) {
      return Wrap(
        alignment: WrapAlignment.center,
        spacing: 16,
        runSpacing: 16,
        children: [
          CardResultHarta(
            title: 'Total Harta',
            result: 'Rp. $formattedTotalHarta',
            color: ColorConstant.red,
          ),
          CardResultHarta(
            title: 'Zakat Dikeluarkan',
            result: 'Rp. $formattedZakatDikeluarkan',
            color: ColorConstant.purple,
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primary,
        title: Text(
          'Calculator Zakat',
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

      body: ListView(
        children: [
          Image.asset(
            'assets/images/bg_header_zakat.png',
            fit: BoxFit.cover,
          ),
          cardHarta(),
          cardResult(formattedTotalHarta, formattedZakatDikeluarkan),
        ],
      ),
    );
  }
}
