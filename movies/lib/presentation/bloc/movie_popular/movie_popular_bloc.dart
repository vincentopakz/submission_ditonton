import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:movies/movies.dart';

part 'movie_popular_event.dart';
part 'movie_popular_state.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  final GetPopularMovies _getPopularMovies;

  MoviePopularBloc(this._getPopularMovies) : super(MoviePopularEmpty()) {
    on<OnMoviePopularCalled>(_onMoviePopularCalled);
  }

  FutureOr<void> _onMoviePopularCalled(
    OnMoviePopularCalled event,
    Emitter<MoviePopularState> emit,
  ) async {
    emit(MoviePopularLoading());

    final result = await _getPopularMovies.execute();

    result.fold(
      (failure) {
        emit(MoviePopularError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(MoviePopularEmpty())
            : emit(MoviePopularHasData(data));
      },
    );
  }
}
