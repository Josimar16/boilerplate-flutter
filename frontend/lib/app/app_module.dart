import 'package:frontend/app/home/presenter/pages/home_page.dart';
import 'package:frontend/app/search/presenter/pages/profile_page.dart';
import 'package:frontend/app/search/presenter/stores/search_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:frontend/app/app_widget.dart';

import 'search/domain/usecases/search_by_text.dart';
import 'search/external/github/github_search_datasource.dart';
import 'search/infra/repositories/search_repository_impl.dart';
import 'search/presenter/pages/search_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $SearchByTextImpl,
        $SearchRepositoryImpl,
        $GithubSearchDatasource,
        Bind((i) => http.Client()),
        $SearchBloc,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            transition: TransitionType.fadeIn, child: (_, __) => HomePage()),
        ModularRouter('/search',
            transition: TransitionType.fadeIn, child: (_, __) => SearchPage()),
        ModularRouter('/profile',
            transition: TransitionType.fadeIn,
            child: (_, args) => ProfilePage(result: args?.data)),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
