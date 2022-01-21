import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_app_core/movie_app_core.dart';
import 'package:movie_app_design_system/movie_app_design_system.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/errors/movie_failures.dart';
import 'movie_banner_store.dart';

class MovieBanner extends StatefulWidget {
  const MovieBanner({Key? key}) : super(key: key);

  @override
  _MovieBannerState createState() => _MovieBannerState();
}

class _MovieBannerState extends State<MovieBanner> {
  final store = Modular.get<MovieBannerStore>();
  int _current = 0;

  @override
  void initState() {
    super.initState();
    store.load();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<MovieBannerStore, Failure, List<Movie>>.transition(
      store: store,
      onError: (context, error) {
        if (error is MovieNowPlayingNoInternetConnection) {
          return NoInternetWidget(
            message: AppConstant.noInternetConnection,
            onPressed: () async => await store.load(),
          );
        }

        return CustomErrorWidget(message: error?.errorMessage);
      },
      onLoading: (context) => const ShimmerBanner(),
      onState: (context, state) {
        if (state.isEmpty) {
          return const SizedBox.shrink(
            key: ValueKey('NothingFound'),
          );
        }
        return StatefulBuilder(
          key: const ValueKey('NothingFound2'),
          builder: (context, setState) => BannerHome(
            isFromMovie: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            data: List.from(
              state.map(
                (e) => ScreenData(
                  e.id,
                  e.title,
                  e.overview,
                  e.releaseDate,
                  e.genreIds,
                  e.voteAverage,
                  e.popularity,
                  e.posterPath,
                  e.backdropPath,
                  e.tvName,
                  e.tvRelease,
                ),
              ),
            ),
            currentIndex: _current,
            routeNameDetail: './detail_movies',
            routeNameAll: '/dashboard/movie_module/now_playing',
          ),
        );
      },
    );
  }
}
