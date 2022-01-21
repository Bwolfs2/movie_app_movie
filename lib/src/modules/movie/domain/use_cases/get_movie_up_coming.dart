import 'package:dartz/dartz.dart';
import 'package:movie_app_core/movie_app_core.dart';

import '../entities/movie.dart';
import '../repositories/movies_repository.dart';

abstract class IGetMovieUpComming {
  Future<Either<Failure, List<Movie>>> call();
}

class GetMovieUpComming implements IGetMovieUpComming {
  final MoviesRepository repository;

  GetMovieUpComming(this.repository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getMovieUpComming();
  }
}
