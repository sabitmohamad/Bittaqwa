import 'package:dashboard_islami/utils/color_constant.dart';
import 'package:flutter/material.dart';

class VideoKajianDetailScreen extends StatefulWidget {
  final String url;
  final String title;
  final String ustadz;
  final String account;
  final String thumbnail;
  final String description;
  const VideoKajianDetailScreen({
    required this.url,
    required this.title,
    required this.ustadz,
    required this.account,
    required this.thumbnail,
    required this.description,
    super.key,
  });

  @override
  State<VideoKajianDetailScreen> createState() => _VideoKajianDetailScreenState();
}

class _VideoKajianDetailScreenState extends State<VideoKajianDetailScreen> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
