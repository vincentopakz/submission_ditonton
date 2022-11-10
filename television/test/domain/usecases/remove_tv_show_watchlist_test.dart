import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:television/television.dart';

import '../../dummy_data/dummy_objects_tv.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late RemoveTVWatchlist usecase;
  late MockTVRepository repository;

  setUp(() {
    repository = MockTVRepository();
    usecase = RemoveTVWatchlist(repository);
  });

  group('Remove watchlist TV Show test', () {
    group('execute', () {
      test('should remove Tv Show watchlist from the repository', () async {
        // arrange
        when(repository.removeWatchlist(testTvDetail))
            .thenAnswer((_) async => const Right('Removed from watchlist'));
        // act
        final result = await usecase.execute(testTvDetail);
        // assert
        expect(result, const Right('Removed from watchlist'));
      });
    });
  });
}
