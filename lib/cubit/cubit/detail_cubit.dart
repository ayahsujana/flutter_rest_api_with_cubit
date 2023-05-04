// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tubevideo_cubit/model/detail_model.dart';
import 'package:tubevideo_cubit/repo/api_services.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(
    this.apiServices,
  ) : super(DetailInitial());

  final ApiServices apiServices;

  void getDetailVideo(String id) async {
    emit(DetailLoading());
    final result = await apiServices.getDetail(id);
    result.fold(
      (l) => emit(DetailError(message: l)),
      (r) => emit(DetailLoaded(detail: r)),
    );
  }
}
