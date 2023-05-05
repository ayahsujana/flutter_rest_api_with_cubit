import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingWidget(BuildContext context) => Center(
      child: SpinKitFadingCircle(
        color: Theme.of(context).primaryColor,
        size: 50.0,
      ),
    );