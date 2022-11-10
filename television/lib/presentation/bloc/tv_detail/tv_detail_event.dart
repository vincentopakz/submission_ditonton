part of 'tv_detail_bloc.dart';

@immutable
abstract class TvDetailEvent extends Equatable {}

class OnTvDetailCalled extends TvDetailEvent {
  final int id;

  OnTvDetailCalled(this.id);

  @override
  List<Object?> get props => [id];
}
