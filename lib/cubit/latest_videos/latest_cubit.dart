// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:tubevideo_cubit/model/video_model.dart';
import 'package:tubevideo_cubit/repo/api_services.dart';

part 'latest_state.dart';

class LatestCubit extends Cubit<LatestState> {
  LatestCubit(
    this.apiServices,
  ) : super(LatestInitial());

  final ApiServices apiServices;

  void getlatestVideos() async {
    emit(LatestLoading());
    final result = await apiServices.getLatest();
    result.fold(
      (l) => emit(LatestError(message: l)),
      (r) => emit(LatestLoaded(latest: r)),
    );
  }
}
