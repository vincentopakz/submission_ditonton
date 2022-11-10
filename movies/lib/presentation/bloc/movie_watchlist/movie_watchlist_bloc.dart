import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:movies/movies.dart';

part 'movie_watchlist_event.dart';
part 'movie_watchlist_state.dart';

class MovieWatchlistBloc
    extends Bloc<MovieWatchlistEvent, MovieWatchlistState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetWatchlistMovies _getWatchlistMovies;
  final GetWatchlistMoviesStatus _getWatchlistMovieStatus;
  final RemoveMovieWatchlist _removeWatchlist;
  final SaveMovieWatchlist _saveWatchlist;

  MovieWatchlistBloc(
    this._getWatchlistMovies,
    this._getWatchlistMovieStatus,
    this._removeWatchlist,
    this._saveWatchlist,
  ) : super(MovieWatchlistInitial()) {
    on<OnFetchMovieWatchlist>(_onFetchMovieWatchlist);
    on<FetchWatchlistStatus>(_fetchWatchlistStatus);
    on<AddMovieToWatchlist>(_addMovieToWatchlist);
    on<RemoveMovieFromWatchlist>(_removeMovieFromWatchlist);
  }

  FutureOr<void> _onFetchMovieWatchlist(
    OnFetchMovieWatchlist event,
    Emitter<MovieWatchlistState> emit,
  ) async {
    emit(MovieWatchlistLoading());

    final result = await _getWatchlistMovies.execute();

    result.fold(
      (failure) {
        emit(MovieWatchlistError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(MovieWatchlistEmpty())
            : emit(MovieWatchlistHasData(data));
      },
    );
  }

  FutureOr<void> _fetchWatchlistStatus(
    FetchWatchlistStatus event,
    Emitter<MovieWatchlistState> emit,
  ) async {
    final id = event.id;

    final result = await _getWatchlistMovieStatus.execute(id);

    emit(MovieIsAddedToWatchlist(result));
  }

  FutureOr<void> _addMovieToWatchlist(
    AddMovieToWatchlist event,
    Emitter<MovieWatchlistState> emit,
  ) async {
    final movie = event.movie;

    final result = await _saveWatchlist.execute(movie);

    result.fold(
      (failure) {
        emit(MovieWatchlistError(failure.message));
      },
      (message) {
        emit(MovieWatchlistMessage(message));
      },
    );
  }

  FutureOr<void> _removeMovieFromWatchlist(
    RemoveMovieFromWatchlist event,
    Emitter<MovieWatchlistState> emit,
  ) async {
    final movie = event.movie;

    final result = await _removeWatchlist.execute(movie);

    result.fold(
      (failure) {
        emit(MovieWatchlistError(failure.message));
      },
      (message) {
        emit(MovieWatchlistMessage(message));
      },
    );
  }
}
