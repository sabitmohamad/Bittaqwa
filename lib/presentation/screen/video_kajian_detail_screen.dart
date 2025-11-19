import 'package:bittaqwa/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoKajianDetailScreen extends StatefulWidget {
  final String url;
  final String title;
  final String ustadz;
  final String account;
  final String description;

  const VideoKajianDetailScreen({
    super.key,
    required this.url,
    required this.title,
    required this.ustadz,
    required this.account,
    required this.description,
  });

  @override
  State<VideoKajianDetailScreen> createState() => _VideoKajianDetailScreenState();
}

class _VideoKajianDetailScreenState extends State<VideoKajianDetailScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayerController.convertUrlToId(widget.url) ?? "";

    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        mute: false,
        enableCaption: true,
      ),
    )..loadVideoById(videoId: videoId);
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Colors.white,
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
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: player,
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
      },
    );
  }
}
