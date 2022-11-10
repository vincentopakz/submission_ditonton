import 'package:mockito/annotations.dart';

import 'package:television/television.dart';

@GenerateMocks([
  GetPopularTVShows,
  GetTopRatedTVShows,
  GetTVOnTheAir,
  GetTVRecommendations,
  GetTVShowDetail,
  GetWatchlistTVShows,
  GetWatchlistTVStatus,
  RemoveTVWatchlist,
  SaveTVWatchList,
])
void main() {}
