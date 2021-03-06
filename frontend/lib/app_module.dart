import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app_widget.dart';
import 'package:frontend/modules/search/container/provider/github_provider.dart';
import 'package:frontend/modules/search/domain/usecases/search_by_text.dart';
import 'package:frontend/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:frontend/modules/search/presenter/search/search_bloc.dart';
import 'package:frontend/modules/search/presenter/search/search_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GithubProvider(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => SearchByTextImpl(i())),
        Bind((i) => SearchBloc(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => SearchPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}