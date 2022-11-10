import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:core/core.dart';
import 'package:movies/movies.dart';

import '../../dummy_data/dummy_objects_movie.dart';
import 'helper/bloc_test_helper.mocks.dart';

void main() {
  late MockGetPopularMovies usecase;
  late MoviePopularBloc movieBloc;

  setUp(() {
    usecase = MockGetPopularMovies();
    movieBloc = MoviePopularBloc(usecase);
  });

  test('initial state should be empty', () {
    expect(movieBloc.state, MoviePopularEmpty());
  });

  blocTest<MoviePopularBloc, MoviePopularState>(
    'should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(usecase.execute()).thenAnswer((_) async => Right(testMovieList));
      return movieBloc;
    },
    act: (bloc) => bloc.add(OnMoviePopularCalled()),
    expect: () => [
      MoviePopularLoading(),
      MoviePopularHasData(testMovieList),
    ],
    verify: (bloc) {
      verify(usecase.execute());
      return OnMoviePopularCalled().props;
    },
  );

  blocTest<MoviePopularBloc, MoviePopularState>(
    'should emit [Loading, Error] when get data is unsuccessful',
    build: () {
      when(usecase.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return movieBloc;
    },
    act: (bloc) => bloc.add(OnMoviePopularCalled()),
    expect: () => [
      MoviePopularLoading(),
      MoviePopularError('Server Failure'),
    ],
    verify: (bloc) => MoviePopularLoading(),
  );

  blocTest<MoviePopularBloc, MoviePopularState>(
    'should emit [Loading, Empty] when get data is empty',
    build: () {
      when(usecase.execute()).thenAnswer((_) async => const Right([]));
      return movieBloc;
    },
    act: (bloc) => bloc.add(OnMoviePopularCalled()),
    expect: () => [
      MoviePopularLoading(),
      MoviePopularEmpty(),
    ],
  );
}
