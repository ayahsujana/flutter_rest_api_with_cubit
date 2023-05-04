import 'dart:convert';

List<Videos> videoListFromJson(String str) {
  var data = jsonDecode(str);
  List items = data["ALL_IN_ONE_VIDEO"];
  return List<Videos>.from(items.map((x) => Videos.fromJson(x)));
}

class Videos {
  String id;
  String catId;
  String videoType;
  String videoTitle;
  String videoUrl;
  String videoId;
  String videoThumbnailB;
  String videoThumbnailS;
  String videoDuration;
  String videoDescription;
  String rateAvg;
  String totelViewer;
  String premium;
  String cid;
  String categoryName;
  String categoryImage;
  String categoryImageThumb;

  Videos({
    required this.id,
    required this.catId,
    required this.videoType,
    required this.videoTitle,
    required this.videoUrl,
    required this.videoId,
    required this.videoThumbnailB,
    required this.videoThumbnailS,
    required this.videoDuration,
    required this.videoDescription,
    required this.rateAvg,
    required this.totelViewer,
    required this.premium,
    required this.cid,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryImageThumb,
  });

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        id: json["id"],
        catId: json["cat_id"],
        videoType: json["video_type"],
        videoTitle: json["video_title"],
        videoUrl: json["video_url"],
        videoId: json["video_id"],
        videoThumbnailB: json["video_thumbnail_b"],
        videoThumbnailS: json["video_thumbnail_s"],
        videoDuration: json["video_duration"],
        videoDescription: json["video_description"],
        rateAvg: json["rate_avg"],
        totelViewer: json["totel_viewer"],
        premium: json["premium"],
        cid: json["cid"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        categoryImageThumb: json["category_image_thumb"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat_id": catId,
        "video_type": videoType,
        "video_title": videoTitle,
        "video_url": videoUrl,
        "video_id": videoId,
        "video_thumbnail_b": videoThumbnailB,
        "video_thumbnail_s": videoThumbnailS,
        "video_duration": videoDuration,
        "video_description": videoDescription,
        "rate_avg": rateAvg,
        "totel_viewer": totelViewer,
        "premium": premium,
        "cid": cid,
        "category_name": categoryName,
        "category_image": categoryImage,
        "category_image_thumb": categoryImageThumb,
      };
}
