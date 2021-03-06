import 'package:frontend/app/search/presenter/search_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:frontend/app/app_widget.dart';

import 'search/domain/usecases/search_by_text.dart';
import 'search/external/github/github_search_datasource.dart';
import 'search/infra/repositories/search_repository_impl.dart';
import 'search/presenter/search_page.dart';

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
        ModularRouter(Modular.initialRoute, child: (_, __) => SearchPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
