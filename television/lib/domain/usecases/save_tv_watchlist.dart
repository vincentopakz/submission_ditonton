import 'package:dartz/dartz.dart';

import 'package:core/core.dart';
import 'package:television/television.dart';

class SaveTVWatchList {
  final TVRepository repository;

  SaveTVWatchList(this.repository);

  Future<Either<Failure, String>> execute(TVDetail tv) {
    return repository.saveWatchlist(tv);
  }
}
