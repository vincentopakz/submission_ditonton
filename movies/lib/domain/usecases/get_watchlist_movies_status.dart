import 'package:movies/movies.dart';

class GetWatchlistMoviesStatus {
  final MovieRepository repository;

  GetWatchlistMoviesStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlist(id);
  }
}
