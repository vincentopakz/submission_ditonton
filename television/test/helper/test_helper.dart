import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

import 'package:core/core.dart';
import 'package:television/television.dart';

@GenerateMocks([
  TVRepository,
  TVRemoteDataSource,
  TVLocalDataSource,
  DatabaseHelper,
  GetWatchlistTVShows,
  GetWatchlistTVStatus,
  RemoveTVWatchlist,
  SaveTVWatchList,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
  MockSpec<IOClient>(as: #MockIOClient),
])
void main() {}
