import 'package:dartz/dartz.dart';
import 'package:movie_app_core/movie_app_core.dart';

import '../entities/crew.dart';
import '../repositories/movies_repository.dart';

abstract class IGetMovieCrewById {
  Future<Either<Failure, List<Crew>>> call(int id);
}

class GetMovieCrewById implements IGetMovieCrewById {
  final MoviesRepository repository;

  GetMovieCrewById(this.repository);

  Future<Either<Failure, List<Crew>>> call(int id) async {
    return await repository.getMovieCrewById(id);
  }
}
