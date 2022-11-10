import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:television/television.dart';

import '../../dummy_data/dummy_objects_tv.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late SaveTVWatchList usecase;
  late MockTVRepository repository;

  setUp(() {
    repository = MockTVRepository();
    usecase = SaveTVWatchList(repository);
  });

  group('save watchlist TV Show test', () {
    group('execute', () {
      test('should add Tv Show watchlist to the repository', () async {
        // arrange
        when(repository.saveWatchlist(testTvDetail))
            .thenAnswer((_) async => const Right('Added to Watchlist'));
        // act
        final result = await usecase.execute(testTvDetail);
        // assert
        expect(result, const Right('Added to Watchlist'));
      });
    });
  });
}
