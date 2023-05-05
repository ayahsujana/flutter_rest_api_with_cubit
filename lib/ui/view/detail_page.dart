// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../cubit/detail_videos/detail_cubit.dart';

class DetailVideoPage extends StatefulWidget {
  const DetailVideoPage({super.key});

  @override
  State<DetailVideoPage> createState() => _DetailVideoPageState();
}

class _DetailVideoPageState extends State<DetailVideoPage> {
  var logger = Logger();

  @override
  void initState() {
    context.read<DetailCubit>().getDetailVideo(Get.arguments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Video'),
      ),
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
            return Text(state.detail[0].videoTitle);
          }
          return const Center(
            child: Text('No found data'),
          );
        },
      ),
    );
  }
}
