import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:television/television.dart';

class FakeTvDetailEvent extends Fake implements TvDetailEvent {}

class FakeTvDetailState extends Fake implements TvDetailState {}

class FakeTvDetailBloc extends MockBloc<TvDetailEvent, TvDetailState>
    implements TvDetailBloc {}

class FakeTvListEvent extends Fake implements TvListEvent {}

class FakeTvListState extends Fake implements TvListState {}

class FakeTvListBloc extends MockBloc<TvListEvent, TvListState>
    implements TvListBloc {}

class FakeTvPopularEvent extends Fake implements TvPopularEvent {}

class FakeTvPopularState extends Fake implements TvPopularState {}

class FakeTvPopularBloc extends MockBloc<TvPopularEvent, TvPopularState>
    implements TvPopularBloc {}

class FakeTvRecomEvent extends Fake implements TvRecommendationEvent {}

class FakeTvRecomState extends Fake implements TvRecommendationState {}

class FakeTvRecomBloc
    extends MockBloc<TvRecommendationEvent, TvRecommendationState>
    implements TvRecommendationBloc {}

class FakeTvTopEvent extends Fake implements TvTopRatedEvent {}

class FakeTvTopState extends Fake implements TvTopRatedState {}

class FakeTvTopBloc extends MockBloc<TvTopRatedEvent, TvTopRatedState>
    implements TvTopRatedBloc {}

class FakeTvWatchlistEvent extends Fake implements TvWatchlistEvent {}

class FakeTvWatchlistState extends Fake implements TvWatchlistState {}

class FakeTvWatchlistBloc extends MockBloc<TvWatchlistEvent, TvWatchlistState>
    implements TvWatchlistBloc {}

class FakeTVWatchlistEvent extends Fake implements TvWatchlistEvent {}

class FakeTVWatchlistState extends Fake implements TvWatchlistState {}

class FakeTVWatchlistBloc extends MockBloc<TvWatchlistEvent, TvWatchlistState>
    implements TvWatchlistBloc {}
