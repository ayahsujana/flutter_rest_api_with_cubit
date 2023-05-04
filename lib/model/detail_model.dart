import 'dart:convert';

List<DetailModel> detailListFromJson(String str) {
  var data = jsonDecode(str);
  List items = data["ALL_IN_ONE_VIDEO"];
  return List<DetailModel>.from(items.map((x) => DetailModel.fromJson(x)));
}

class DetailModel {
  String catId;
  String categoryName;
  String id;
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

  DetailModel({
    required this.catId,
    required this.categoryName,
    required this.id,
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
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        catId: json["cat_id"],
        categoryName: json["category_name"],
        id: json["id"],
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
      );

  Map<String, dynamic> toJson() => {
        "cat_id": catId,
        "category_name": categoryName,
        "id": id,
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
      };
}
