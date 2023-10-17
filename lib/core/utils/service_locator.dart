import 'package:bookly/Features/home/data/repos/home_repo_implment.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/search/data/repos/home_repo_implment.dart';
import 'api_service.dart';

final getIt = GetIt.instance;
void setup() {  // singleton is the used of method we take acopy of it many times so we make it one time and reused it
  getIt.registerSingleton<ApiService>(ApiService(Dio()));   /// here a singleton for apiservice
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));  // here singleton for homerepo
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(getIt.get<ApiService>()));  // here singleton for homerepo
}
