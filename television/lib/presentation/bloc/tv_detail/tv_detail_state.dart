part of 'tv_detail_bloc.dart';

@immutable
abstract class TvDetailState extends Equatable {}

class TvDetailEmpty extends TvDetailState {
  @override
  List<Object?> get props => [];
}

class TvDetailLoading extends TvDetailState {
  @override
  List<Object?> get props => [];
}

class TvDetailError extends TvDetailState {
  final String message;

  TvDetailError(this.message);

  @override
  List<Object?> get props => [message];
}

class TvDetailHasData extends TvDetailState {
  final TVDetail result;

  TvDetailHasData(this.result);

  @override
  List<Object?> get props => [result];
}
