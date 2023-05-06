// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubevideo_cubit/custom/loading_widget.dart';
import 'package:tubevideo_cubit/ui/view/detail_page.dart';

class ImageVideoRow extends StatelessWidget {
  const ImageVideoRow({
    Key? key,
    required this.id,
    required this.videoId,
    required this.title,
    required this.category,
    required this.watched,
  }) : super(key: key);
  final String id;
  final String videoId;
  final String title;
  final String category;
  final String watched;

  @override
  Widget build(BuildContext context) {
    String imagePoster = "https://img.youtube.com/vi/$videoId/0.jpg";
    return InkWell(
      onTap: () => Get.to(const DetailVideoPage(), arguments: {'videoId': videoId, 'id': id}),
      child: SizedBox(
        width: Get.width,
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: imagePoster,
                  width: 175,
                  height: 95,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Image.asset(
                    'assets/images/loading.gif',
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          category,
                          style: GoogleFonts.pangolin(
                              fontSize: 15,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.remove_red_eye_rounded,
                          color: Colors.grey,
                          size: 22,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          watched,
                          style: GoogleFonts.pangolin(
                              fontSize: 15,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
