part of 'tv_on_the_air_bloc.dart';

@immutable
abstract class TvListEvent extends Equatable {}

class OnTvShowListCalled extends TvListEvent {
  @override
  List<Object?> get props => [];
}
