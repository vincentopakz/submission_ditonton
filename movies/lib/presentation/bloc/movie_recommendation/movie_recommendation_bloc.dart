import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:movies/movies.dart';

part 'movie_recommendation_event.dart';
part 'movie_recommendation_state.dart';

class MovieRecommendationBloc
    extends Bloc<MovieRecommendationEvent, MovieRecommendationState> {
  final GetMovieRecommendations _getMovieRecommendations;

  MovieRecommendationBloc(this._getMovieRecommendations)
      : super(MovieRecommendationEmpty()) {
    on<OnMovieRecommendationCalled>(_onMovieRecommendationCalled);
  }

  FutureOr<void> _onMovieRecommendationCalled(
    OnMovieRecommendationCalled event,
    Emitter<MovieRecommendationState> emit,
  ) async {
    final id = event.id;
    emit(MovieRecommendationLoading());

    final result = await _getMovieRecommendations.execute(id);

    result.fold(
      (failure) {
        emit(MovieRecommendationError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(MovieRecommendationEmpty())
            : emit(MovieRecommendationHasData(data));
      },
    );
  }
}
