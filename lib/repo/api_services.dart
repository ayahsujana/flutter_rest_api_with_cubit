// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:tubevideo_cubit/model/video_model.dart';
import 'package:tubevideo_cubit/network/api.dart';

class ApiServices {
  final http.Client client;
  ApiServices({
    required this.client,
  });

  Future<Either<String, List<Videos>>> getLatest() async {
    try {
      final res = await client.get(Uri.parse(ApiUrl.latestVideos));
      return Right(List<Videos>.from(jsonDecode(res.body).map(
        (x) => Videos.fromJson(x),
      )).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Videos>> getDetail(String id) async {
    try {
      final res = await client.get(Uri.parse(ApiUrl.detailVideos + id));
      return Right(Videos.fromJson(jsonDecode(res.body)));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
