import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:movies/movies.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieNowPlayingBloc extends Bloc<MovieNowPlayingEvent, MovieNowPlayingState> {
  final GetNowPlayingMovies _getNowPlayingMovies;

  MovieNowPlayingBloc(
    this._getNowPlayingMovies,
  ) : super(MovieNowPlayingEmpty()) {
    on<OnMovieListCalled>(_onMovieListCalled);
  }

  FutureOr<void> _onMovieListCalled(
      MovieNowPlayingEvent event, Emitter<MovieNowPlayingState> emit) async {
    emit(MovieNowPlayingLoading());

    final result = await _getNowPlayingMovies.execute();

    result.fold(
      (failure) {
        emit(MovieNowPlayingError(failure.message));
      },
      (data) {
        data.isEmpty ? emit(MovieNowPlayingEmpty()) : emit(MovieNowPlayingHasData(data));
      },
    );
  }
}
