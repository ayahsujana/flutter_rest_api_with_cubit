// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:tubevideo_cubit/ui/custom_view/image_view_detail.dart';

import '../../cubit/detail_videos/detail_cubit.dart';

class DetailVideoPage extends StatefulWidget {
  const DetailVideoPage({super.key});

  @override
  State<DetailVideoPage> createState() => _DetailVideoPageState();
}

class _DetailVideoPageState extends State<DetailVideoPage> {
  late PodPlayerController _controller;

  @override
  void initState() {
    super.initState();
    context.read<DetailCubit>().getDetailVideo(Get.arguments['id']);
    _controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube(
            'https://youtu.be/${Get.arguments['videoId']}'))
      ..initialise();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          if (state is DetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DetailError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is DetailLoaded) {
            return SafeArea(
                child: Column(children: [
              PodVideoPlayer(
                controller: _controller,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Expanded(child: DetailPageView(states: state.detail)),
              )
            ]));
          }
          return const Center(
            child: Text('No found data'),
          );
        },
      ),
    );
  }
}
