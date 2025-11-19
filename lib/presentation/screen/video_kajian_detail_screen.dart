import 'package:dashboard_islami/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoKajianDetailScreen extends StatefulWidget {
  final String url;
  final String title;
  final String ustadz;
  final String account;
  final String description;

  const VideoKajianDetailScreen({
    required this.url,
    required this.title,
    required this.ustadz,
    required this.account,
    required this.description,
    super.key,
  });

  @override
  State<VideoKajianDetailScreen> createState() => _VideoKajianDetailScreenState();
}

class _VideoKajianDetailScreenState extends State<VideoKajianDetailScreen> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primary,
        title: Text(
          widget.title,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _youtubePlayerController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              onReady: () {
                _youtubePlayerController.addListener(() {
                  setState(() {});
                });
              },
            ),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.account,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: "PoppinsRegular",
                ),
              ),
            ),

            const SizedBox(height: 6),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.ustadz,
                style: TextStyle(
                  color: ColorConstant.primary,
                  fontSize: 16,
                  fontFamily: "PoppinsMedium",
                ),
              ),
            ),

            const SizedBox(height: 6),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: "PoppinsSemiBold",
                ),
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Colors.black87,
                  fontFamily: "PoppinsRegular",
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
