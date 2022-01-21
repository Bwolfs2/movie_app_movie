import 'package:dartz/dartz.dart';
import 'package:movie_app_core/movie_app_core.dart';

import '../entities/crew.dart';
import '../repositories/movies_repository.dart';

abstract class IGetTvShowCrewById {
  Future<Either<Failure, List<Crew>>> call(int id);
}

class GetTvShowCrewById implements IGetTvShowCrewById {
  final MoviesRepository repository;

  GetTvShowCrewById(this.repository);

  Future<Either<Failure, List<Crew>>> call(int id) async {
    return await repository.getTvShowCrewById(id);
  }
}
