import 'package:core/core.dart';
import 'package:television/television.dart';

const testTVModel = TVModel(
  backdropPath: '/path.jpg',
  firstAirDate: 'firstAirDate',
  genreIds: [1, 2, 3],
  id: 1,
  name: 'name',
  originCountry: ['originCountry'],
  originalLanguage: 'originalLanguage',
  originalName: 'originalName',
  overview: 'overview',
  popularity: 9.9,
  posterPath: '/path.jpg',
  voteAverage: 9.9,
  voteCount: 1,
);

final testTVModelList = [testTVModel];
final testTVList = [testTVEntity];

final testTVModelResponse = TvResponse(tvList: testTVModelList);

final testTVEntity = TV(
  backdropPath: '/path.jpg',
  firstAirDate: 'firstAirDate',
  genreIds: const [1, 2, 3],
  id: 1,
  name: 'name',
  originCountry: const ['originCountry'],
  originalLanguage: 'originalLanguage',
  originalName: 'originalName',
  overview: 'overview',
  popularity: 9.9,
  posterPath: '/path.jpg',
  voteAverage: 9.9,
  voteCount: 1,
);

const testTvDetail = TVDetail(
  backdropPath: 'backdropPath',
  firstAirDate: "2021-01-01",
  genres: [Genre(id: 4, name: 'action')],
  homepage: 'homepage',
  id: 1,
  inProduction: false,
  name: 'name',
  originCountry: ['originCountry'],
  originalLanguage: 'originalLanguage',
  originalName: 'originalName',
  overview: 'overview',
  popularity: 8.8,
  posterPath: '/path.jpg',
  tagline: 'tagline',
  type: 'type',
  voteAverage: 9.9,
  voteCount: 200,
);

const testTvDetailResponse = TvDetailResponse(
  backdropPath: 'backdropPath',
  firstAirDate: "2021-01-01",
  genres: [GenreModel(id: 4, name: 'action')],
  homepage: 'homepage',
  id: 1,
  inProduction: false,
  name: 'name',
  originCountry: ['originCountry'],
  originalLanguage: 'originalLanguage',
  originalName: 'originalName',
  overview: 'overview',
  popularity: 8.8,
  posterPath: '/path.jpg',
  tagline: 'tagline',
  type: 'type',
  voteAverage: 9.9,
  voteCount: 200,
);

const testTvDetailResponseMap = {
  "backdrop_path": "backdropPath",
  "first_air_date": "2021-01-01",
  "genres": [
    {"id": 4, "name": "action"}
  ],
  "homepage": "homepage",
  "id": 1,
  "in_production": false,
  "name": "name",
  "origin_country": ["originCountry"],
  "original_language": "originalLanguage",
  "original_name": "originalName",
  "overview": "overview",
  "popularity": 8.8,
  "poster_path": "/path.jpg",
  "tagline": "tagline",
  "type": "type",
  "vote_average": 9.9,
  "vote_count": 200
};

final testWatchlistTV = TV.watchlist(
  id: 1,
  overview: 'overview',
  posterPath: '/path.jpg',
  name: 'name',
);

const testTVTable = TVTable(
  id: 1,
  name: 'name',
  posterPath: '/path.jpg',
  overview: 'overview',
);

final testTVMap = {
  'id': 1,
  'name': 'name',
  'posterPath': '/path.jpg',
  'overview': 'overview',
};

const testTVCache = TVTable(
  id: 1,
  name: 'name',
  posterPath: '/path.jpg',
  overview: 'overview',
);

final testTVCacheMap = {
  'id': 1,
  'name': 'name',
  'posterPath': '/path.jpg',
  'overview': 'overview',
};

final testTVFromCache = TV.watchlist(
  id: 1,
  overview: 'overview',
  posterPath: '/path.jpg',
  name: 'name',
);
