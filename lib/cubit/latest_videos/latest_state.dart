// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'latest_cubit.dart';

abstract class LatestState extends Equatable {
  const LatestState();

  @override
  List<Object> get props => [];
}

class LatestInitial extends LatestState {}

class LatestLoading extends LatestState {}

class LatestLoaded extends LatestState {
  final List<Videos> latest;
  const LatestLoaded({
    required this.latest,
  });

  @override
  List<Object> get props => [latest];
}

class LatestError extends LatestState {
  final String message;
  const LatestError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
