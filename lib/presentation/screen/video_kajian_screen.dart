import 'package:bittaqwa/data/video_data.dart';
import 'package:bittaqwa/presentation/screen/video_kajian_detail_screen.dart';
import 'package:bittaqwa/utils/color_constant.dart';
import 'package:flutter/material.dart';

class VideoKajianScreen extends StatelessWidget {
  const VideoKajianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primary,
        title: Text(
          'Video Kajian',
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
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoKajianDetailScreen(
                    url: videos[index]['url']!,
                    account: videos[index]['account']!,
                    ustadz: videos[index]['ustadz']!,
                    title: videos[index]['title']!,
                    description: videos[index]['description']!,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.asset(
                            videos[index]['thumbnail']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          top: 0,
                          left: 0,
                          child: Icon(
                            Icons.play_circle_outline,
                            color: ColorConstant.primary,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        videos[index]['account']!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: 'PoppinsRegular',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        videos[index]['ustadz']!,
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorConstant.primary,
                          fontFamily: 'PoppinsMedium',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        videos[index]['title']!,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'PoppinsSemiBold',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
