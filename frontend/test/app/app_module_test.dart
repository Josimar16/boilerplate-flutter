import 'dart:convert';

import 'package:frontend/app/app_module.dart';
import 'package:frontend/app/search/domain/entities/result.dart';
import 'package:frontend/app/search/domain/usecases/search_by_text.dart';
import 'package:http/http.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HttpMock extends Mock implements Client {}

main() {
  var client = HttpMock();

  initModule(
    AppModule(),
    changeBinds: [
      Bind((i) => client),
    ],
  );

  test('should be able execute usecase search_by_text', () async {
    when(client.get(any)).thenAnswer((_) async => Response(jsonResponse, 200));

    var usecase = Modular.get<SearchByText>();
    var result = await usecase("josimar16");
    expect(result.isRight(), true);
    expect(result | null, isA<List<Result>>());
  });
}

var jsonResponse = r'''{
  "total_count": 27920,
  "incomplete_results": false,
  "items": [
    {
      "login": "josimar16",
      "id": 3121,
      "node_id": "MDQ6VXNlcjMxMjE=",
      "avatar_url": "https://avatars1.githubusercontent.com/u/3121?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/Josimar16",
      "html_url": "https://github.com/Josimar16",
      "followers_url": "https://api.github.com/users/Josimar16/followers",
      "following_url": "https://api.github.com/users/Josimar16/following{/other_user}",
      "gists_url": "https://api.github.com/users/Josimar16/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/Josimar16/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/Josimar16/subscriptions",
      "organizations_url": "https://api.github.com/users/Josimar16/orgs",
      "repos_url": "https://api.github.com/users/Josimar16/repos",
      "events_url": "https://api.github.com/users/Josimar16/events{/privacy}",
      "received_events_url": "https://api.github.com/users/Josimar16/received_events",
      "type": "User",
      "site_admin": false,
      "score": 1.0
    },
    {
      "login": "josimar1628",
      "id": 78266555,
      "node_id": "MDQ6VXNlcjc4MjY2NTU1",
      "avatar_url": "https://avatars.githubusercontent.com/u/78266555?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/josimar1628",
      "html_url": "https://github.com/josimar1628",
      "followers_url": "https://api.github.com/users/josimar1628/followers",
      "following_url": "https://api.github.com/users/josimar1628/following{/other_user}",
      "gists_url": "https://api.github.com/users/josimar1628/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/josimar1628/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/josimar1628/subscriptions",
      "organizations_url": "https://api.github.com/users/josimar1628/orgs",
      "repos_url": "https://api.github.com/users/josimar1628/repos",
      "events_url": "https://api.github.com/users/josimar1628/events{/privacy}",
      "received_events_url": "https://api.github.com/users/josimar1628/received_events",
      "type": "User",
      "site_admin": false,
      "score": 1.0
    }
  ]
}''';
