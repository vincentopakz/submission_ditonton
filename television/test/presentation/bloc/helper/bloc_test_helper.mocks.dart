// Mocks generated by Mockito 5.3.2 from annotations
// in television/test/presentation/bloc/helper/bloc_test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:core/core.dart' as _i5;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:television/television.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTVRepository_0 extends _i1.SmartFake implements _i2.TVRepository {
  _FakeTVRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetPopularTVShows].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularTVShows extends _i1.Mock implements _i2.GetPopularTVShows {
  MockGetPopularTVShows() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>>.value(
            _FakeEither_1<_i5.Failure, List<_i2.TV>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>>);
}

/// A class which mocks [GetTopRatedTVShows].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedTVShows extends _i1.Mock
    implements _i2.GetTopRatedTVShows {
  MockGetTopRatedTVShows() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>>.value(
            _FakeEither_1<_i5.Failure, List<_i2.TV>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>>);
}

/// A class which mocks [GetTVOnTheAir].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTVOnTheAir extends _i1.Mock implements _i2.GetTVOnTheAir {
  MockGetTVOnTheAir() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>>.value(
            _FakeEither_1<_i5.Failure, List<_i2.TV>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>>);
}

/// A class which mocks [GetTVRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTVRecommendations extends _i1.Mock
    implements _i2.GetTVRecommendations {
  MockGetTVRecommendations() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>>.value(
            _FakeEither_1<_i5.Failure, List<_i2.TV>>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>>);
}

/// A class which mocks [GetTVShowDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTVShowDetail extends _i1.Mock implements _i2.GetTVShowDetail {
  MockGetTVShowDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i4.Future<_i3.Either<_i5.Failure, _i2.TVDetail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i4.Future<_i3.Either<_i5.Failure, _i2.TVDetail>>.value(
            _FakeEither_1<_i5.Failure, _i2.TVDetail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i4.Future<_i3.Either<_i5.Failure, _i2.TVDetail>>);
}

/// A class which mocks [GetWatchlistTVShows].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistTVShows extends _i1.Mock
    implements _i2.GetWatchlistTVShows {
  MockGetWatchlistTVShows() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>>.value(
            _FakeEither_1<_i5.Failure, List<_i2.TV>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i4.Future<_i3.Either<_i5.Failure, List<_i2.TV>>>);
}

/// A class which mocks [GetWatchlistTVStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistTVStatus extends _i1.Mock
    implements _i2.GetWatchlistTVStatus {
  MockGetWatchlistTVStatus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i4.Future<bool> execute(int? id) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [RemoveTVWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveTVWatchlist extends _i1.Mock implements _i2.RemoveTVWatchlist {
  MockRemoveTVWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i4.Future<_i3.Either<_i5.Failure, String>> execute(_i2.TVDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tv],
        ),
        returnValue: _i4.Future<_i3.Either<_i5.Failure, String>>.value(
            _FakeEither_1<_i5.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tv],
          ),
        )),
      ) as _i4.Future<_i3.Either<_i5.Failure, String>>);
}

/// A class which mocks [SaveTVWatchList].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveTVWatchList extends _i1.Mock implements _i2.SaveTVWatchList {
  MockSaveTVWatchList() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i4.Future<_i3.Either<_i5.Failure, String>> execute(_i2.TVDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tv],
        ),
        returnValue: _i4.Future<_i3.Either<_i5.Failure, String>>.value(
            _FakeEither_1<_i5.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tv],
          ),
        )),
      ) as _i4.Future<_i3.Either<_i5.Failure, String>>);
}