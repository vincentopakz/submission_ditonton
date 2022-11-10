import 'package:dartz/dartz.dart';

import 'package:core/core.dart';
import 'package:television/television.dart';

class GetWatchlistTVShows {
  final TVRepository _repository;

  GetWatchlistTVShows(this._repository);

  Future<Either<Failure, List<TV>>> execute() {
    return _repository.getWatchListTVShow();
  }
}
