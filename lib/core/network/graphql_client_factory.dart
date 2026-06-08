// lib/core/network/graphql_client_factory.dart
import 'package:authproject/core/constants/app_constants.dart';
import 'package:authproject/core/services/token_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClientFactory {
  final TokenService tokenService;

  GraphQLClientFactory(this.tokenService);

  GraphQLClient create() {
    final httpLink = HttpLink(AppConstants.graphqlBaseUrl);
    final authLink = AuthLink(
      getToken: () async {
        final token = await tokenService.getToken();
        if (token == null || token.isEmpty) {
          return null;
        }
        return 'Bearer $token';
      },
    );

    return GraphQLClient(
      cache: GraphQLCache(),
      link: authLink.concat(httpLink),
    );
  }
}
