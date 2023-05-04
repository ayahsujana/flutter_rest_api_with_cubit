import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:tubevideo_cubit/model/detail_model.dart';
import 'package:tubevideo_cubit/model/latest_model.dart';
import 'package:tubevideo_cubit/network/api.dart';

class ApiServices {
  final http.Client client;
  ApiServices({
    required this.client,
  });

  Future<Either<String, List<Videos>>> getLatest() async {
    try {
      final res = await client.get(Uri.parse(ApiUrl.latestVideos));
      return Right(videoListFromJson(res.body));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<DetailModel>>> getDetail(String id) async {
    try {
      final res = await client.get(Uri.parse('${ApiUrl.detailVideos}$id'));
      return Right(detailListFromJson(res.body));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
