import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tubevideo_cubit/cubit/latest_videos/latest_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:tubevideo_cubit/custom/color_widget.dart';
import 'package:tubevideo_cubit/repo/api_services.dart';
import 'package:tubevideo_cubit/ui/view/latest_page.dart';

import 'cubit/detail_videos/detail_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LatestCubit(
            ApiServices(
              client: http.Client(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => DetailCubit(
            ApiServices(
              client: http.Client(),
            ),
          ),
        ),
      ],
      child: GetMaterialApp(
        title: 'Kids Funny Videos',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: primaryColor,
          scaffoldBackgroundColor: primaryColor,
          primarySwatch: Colors.blue
        ),
        home: const LatestVideosPage(),
      ),
    );
  }
}
