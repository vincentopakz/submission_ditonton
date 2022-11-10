part of 'movie_list_bloc.dart';

@immutable
abstract class MovieNowPlayingState extends Equatable {}

class MovieNowPlayingEmpty extends MovieNowPlayingState {
  @override
  List<Object> get props => [];
}

class MovieNowPlayingLoading extends MovieNowPlayingState {
  @override
  List<Object> get props => [];
}

class MovieNowPlayingError extends MovieNowPlayingState {
  final String message;

  MovieNowPlayingError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieNowPlayingHasData extends MovieNowPlayingState {
  final List<Movie> result;

  MovieNowPlayingHasData(this.result);

  @override
  List<Object> get props => [result];
}
