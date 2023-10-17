import 'package:bookly/Features/home/presentation/view_models/similar_books_details/similar_books_details_cubit.dart';
import 'package:bookly/Features/home/presentation/views/Book_detail_view.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/core/utils/book/book.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/views/SplashView.dart';
import '../../Features/home/data/repos/home_repo_implment.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/homeView',
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: '/bookDetail',
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksDetailsCubit(
          getIt.get<HomeRepoImpl>()
        ),
        child: BookDetailsView(
          bookModel: state.extra as Book,
        ),
      ),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => SearchView(),
    ),
  ]);
}
