// lib/features/auth/data/datasources/auth_remote_datasource.dart
import 'package:authproject/features/auth/data/models/auth_payload_model.dart';
import 'package:authproject/features/auth/data/models/user_model.dart';
import 'package:authproject/graphql/queries.graphql.dart';
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

  @override
  Future<AuthPayloadModel> login({
    required String email,
    required String passwordPlain,
  }) async {
    final result = await client.mutate$Login(
      Options$Mutation$Login(
        variables: Variables$Mutation$Login(
          email: email,
          password: passwordPlain,
        ),
      ),
    );

    if (result.hasException) {
      throw Exception(
        _resolveErrorMessage(result.exception, 'Unable to login'),
      );
    }

    final data = result.parsedData?.login;
    if (data == null) {
      throw Exception('Empty response returned from login');
    }

    return AuthPayloadModel(
      token: data.token,
      user: UserModel(id: data.user.id, email: data.user.email),
    );
  }

  @override
  Future<AuthPayloadModel> register({
    required String email,
    required String passwordPlain,
  }) async {
    final result = await client.mutate$Register(
      Options$Mutation$Register(
        variables: Variables$Mutation$Register(
          email: email,
          passwordPlain: passwordPlain,
        ),
      ),
    );

    if (result.hasException) {
      throw Exception(
        _resolveErrorMessage(result.exception, 'Unable to register'),
      );
    }

    final data = result.parsedData?.register;
    if (data == null) {
      throw Exception('Empty response returned from register');
    }

    return AuthPayloadModel(
      token: data.token,
      user: UserModel(id: data.user.id, email: data.user.email),
    );
  }

  @override
  Future<UserModel> getMe() async {
    final result = await client.query$Me(
      Options$Query$Me(fetchPolicy: FetchPolicy.networkOnly),
    );

    if (result.hasException) {
      throw Exception(
        _resolveErrorMessage(result.exception, 'Unable to load current user'),
      );
    }

    final me = result.parsedData?.me;
    if (me == null) {
      throw Exception('User profile is not available');
    }

    return UserModel(id: me.id, email: me.email);
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
