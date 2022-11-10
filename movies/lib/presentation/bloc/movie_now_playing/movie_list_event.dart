part of 'movie_list_bloc.dart';

@immutable
abstract class MovieNowPlayingEvent extends Equatable {}

class OnMovieListCalled extends MovieNowPlayingEvent {
  @override
  List<Object> get props => [];
}
