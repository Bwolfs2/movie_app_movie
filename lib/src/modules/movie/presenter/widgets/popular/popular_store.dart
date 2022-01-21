import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_app_core/movie_app_core.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/use_cases/get_movie_popular.dart';

class PopularStore extends StreamStore<Failure, List<Movie>> {
  final IGetMoviePopular _getMoviePopular;
  PopularStore(this._getMoviePopular) : super([]);

  Future<void> load() async => executeEither(() => DartzEitherAdapter.adapter(_getMoviePopular()));
}
