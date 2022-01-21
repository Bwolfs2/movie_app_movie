import 'package:dartz/dartz.dart';
import 'package:movie_app_core/movie_app_core.dart';

import '../entities/movie.dart';
import '../repositories/movies_repository.dart';

abstract class IGetMoviePopular {
  Future<Either<Failure, List<Movie>>> call();
}

class GetMoviePopular implements IGetMoviePopular {
  final MoviesRepository repository;

  GetMoviePopular(this.repository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getMoviePopular();
  }
}
