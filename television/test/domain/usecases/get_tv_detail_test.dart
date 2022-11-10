import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:television/television.dart';
import '../../dummy_data/dummy_objects_tv.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late GetTVShowDetail usecase;
  late MockTVRepository repository;

  setUp(() {
    repository = MockTVRepository();
    usecase = GetTVShowDetail(repository);
  });

  const tId = 1;

  group('Get Detail TV Show test', () {
    group('execute', () {
      test('should get movie detail from the repository', () async {
        // arrange
        when(repository.getTVShowDetail(tId))
            .thenAnswer((_) async => const Right(testTvDetail));
        // act
        final result = await usecase.execute(tId);
        // assert
        expect(result, const Right(testTvDetail));
      });
    });
  });
}
