import 'package:bookly/Features/search/data/repos/home_repo_implment.dart';
import 'package:bookly/Features/search/presentation/views/widget/seach_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../view_model/cubit/search_cubit.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) => SearchCubit(getIt.get<HomeRepoImp>()),
        child: SearchViewBody(),
      )),
    );
  }
}
