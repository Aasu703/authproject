// lib/features/auth/data/datasources/auth_remote_datasource.dart
import 'package:authproject/features/auth/data/models/auth_payload_model.dart';
import 'package:authproject/features/auth/data/models/user_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<AuthPayloadModel> login({
    required String email,
    required String passwordPlain,
  });

  Future<AuthPayloadModel> register({
    required String email,
    required String passwordPlain,
  });

  Future<UserModel> getMe();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final GraphQLClient client;

  AuthRemoteDataSourceImpl(this.client);

  static const String loginMutation = r'''
    mutation Login($email: String!, $passwordPlain: String!) {
      login(email: $email, passwordPlain: $passwordPlain) {
        token
        user {
          id
          email
        }
      }
    }
  ''';

  static const String registerMutation = r'''
    mutation Register($email: String!, $passwordPlain: String!) {
      register(email: $email, passwordPlain: $passwordPlain) {
        token
        user {
          id
          email
        }
      }
    }
  ''';

  static const String meQuery = r'''
    query Me {
      me {
        id
        email
      }
    }
  ''';

  @override
  Future<AuthPayloadModel> login({
    required String email,
    required String passwordPlain,
  }) async {
    final result = await client.mutate(
      MutationOptions(
        document: gql(loginMutation),
        variables: <String, dynamic>{
          'email': email,
          'passwordPlain': passwordPlain,
        },
      ),
    );

    return _parseAuthPayload(result, 'login');
  }

  @override
  Future<AuthPayloadModel> register({
    required String email,
    required String passwordPlain,
  }) async {
    final result = await client.mutate(
      MutationOptions(
        document: gql(registerMutation),
        variables: <String, dynamic>{
          'email': email,
          'passwordPlain': passwordPlain,
        },
      ),
    );

    return _parseAuthPayload(result, 'register');
  }

  @override
  Future<UserModel> getMe() async {
    final result = await client.query(
      QueryOptions(
        document: gql(meQuery),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw Exception(
        _resolveErrorMessage(result.exception, 'Unable to load current user'),
      );
    }

    final meJson = result.data?['me'];
    if (meJson == null) {
      throw Exception('User profile is not available');
    }

    return UserModel.fromJson(Map<String, dynamic>.from(meJson as Map));
  }

  AuthPayloadModel _parseAuthPayload(QueryResult result, String actionName) {
    if (result.hasException) {
      throw Exception(
        _resolveErrorMessage(result.exception, 'Unable to $actionName'),
      );
    }

    final payloadJson = result.data?[actionName];
    if (payloadJson == null) {
      throw Exception('Empty response returned from $actionName');
    }

    return AuthPayloadModel.fromJson(
      Map<String, dynamic>.from(payloadJson as Map),
    );
  }

  String _resolveErrorMessage(
    OperationException? exception,
    String fallbackMessage,
  ) {
    final graphqlError = exception?.graphqlErrors.isNotEmpty == true
        ? exception!.graphqlErrors.first.message
        : null;
    return graphqlError ??
        exception?.linkException?.toString() ??
        fallbackMessage;
  }
}
