import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tubevideo_cubit/cubit/latest_videos/latest_cubit.dart';
import 'package:tubevideo_cubit/ui/detail_page.dart';

class LatestVideosPage extends StatefulWidget {
  const LatestVideosPage({super.key});

  @override
  State<LatestVideosPage> createState() => _LatestVideosPageState();
}

class _LatestVideosPageState extends State<LatestVideosPage> {
  @override
  void initState() {
    context.read<LatestCubit>().getlatestVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest Videos'),
      ),
      body: BlocBuilder<LatestCubit, LatestState>(builder: ((context, state) {
        if (state is LatestLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LatestError) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is LatestLoaded) {
          return ListView.builder(
              itemCount: state.latest.length,
              itemBuilder: (context, index) {
                var latest = state.latest[index];
                return InkWell(
                  onTap: () =>
                      Get.to(const DetailVideoPage(), arguments: latest.id),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        latest.videoTitle,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        latest.videoDescription,
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.amber,
                        maxRadius: 25,
                        child: Center(
                          child: Text(latest.id),
                        ),
                      ),
                    ),
                  ),
                );
              });
        }
        return const Center(child: Text('No fount data'));
      })),
    );
  }
}
