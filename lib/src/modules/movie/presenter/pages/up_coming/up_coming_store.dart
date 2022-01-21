import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_app_core/movie_app_core.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/use_cases/get_movie_up_coming.dart';

class UpComingStore extends StreamStore<Failure, List<Movie>> {
  final IGetMovieUpComming _getMovieUpComming;
  UpComingStore(this._getMovieUpComming) : super([]) {
    load();
  }

  Future<void> load() async => executeEither(() => DartzEitherAdapter.adapter(_getMovieUpComming()));
}
