import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$GetAllProducts {
  factory Variables$Query$GetAllProducts({int? first, String? after}) =>
      Variables$Query$GetAllProducts._({
        if (first != null) r'first': first,
        if (after != null) r'after': after,
      });

  Variables$Query$GetAllProducts._(this._$data);

  factory Variables$Query$GetAllProducts.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    return Variables$Query$GetAllProducts._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetAllProducts<Variables$Query$GetAllProducts>
  get copyWith => CopyWith$Variables$Query$GetAllProducts(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetAllProducts ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    final l$after = after;
    final lOther$after = other.after;
    if (_$data.containsKey('after') != other._$data.containsKey('after')) {
      return false;
    }
    if (l$after != lOther$after) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$after = after;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetAllProducts<TRes> {
  factory CopyWith$Variables$Query$GetAllProducts(
    Variables$Query$GetAllProducts instance,
    TRes Function(Variables$Query$GetAllProducts) then,
  ) = _CopyWithImpl$Variables$Query$GetAllProducts;

  factory CopyWith$Variables$Query$GetAllProducts.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetAllProducts;

  TRes call({int? first, String? after});
}

class _CopyWithImpl$Variables$Query$GetAllProducts<TRes>
    implements CopyWith$Variables$Query$GetAllProducts<TRes> {
  _CopyWithImpl$Variables$Query$GetAllProducts(this._instance, this._then);

  final Variables$Query$GetAllProducts _instance;

  final TRes Function(Variables$Query$GetAllProducts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? first = _undefined, Object? after = _undefined}) => _then(
    Variables$Query$GetAllProducts._({
      ..._instance._$data,
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetAllProducts<TRes>
    implements CopyWith$Variables$Query$GetAllProducts<TRes> {
  _CopyWithStubImpl$Variables$Query$GetAllProducts(this._res);

  TRes _res;

  call({int? first, String? after}) => _res;
}

class Query$GetAllProducts {
  Query$GetAllProducts({required this.allProducts, this.$__typename = 'Query'});

  factory Query$GetAllProducts.fromJson(Map<String, dynamic> json) {
    final l$allProducts = json['allProducts'];
    final l$$__typename = json['__typename'];
    return Query$GetAllProducts(
      allProducts: Query$GetAllProducts$allProducts.fromJson(
        (l$allProducts as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetAllProducts$allProducts allProducts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$allProducts = allProducts;
    _resultData['allProducts'] = l$allProducts.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$allProducts = allProducts;
    final l$$__typename = $__typename;
    return Object.hashAll([l$allProducts, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetAllProducts || runtimeType != other.runtimeType) {
      return false;
    }
    final l$allProducts = allProducts;
    final lOther$allProducts = other.allProducts;
    if (l$allProducts != lOther$allProducts) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetAllProducts on Query$GetAllProducts {
  CopyWith$Query$GetAllProducts<Query$GetAllProducts> get copyWith =>
      CopyWith$Query$GetAllProducts(this, (i) => i);
}

abstract class CopyWith$Query$GetAllProducts<TRes> {
  factory CopyWith$Query$GetAllProducts(
    Query$GetAllProducts instance,
    TRes Function(Query$GetAllProducts) then,
  ) = _CopyWithImpl$Query$GetAllProducts;

  factory CopyWith$Query$GetAllProducts.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllProducts;

  TRes call({
    Query$GetAllProducts$allProducts? allProducts,
    String? $__typename,
  });
  CopyWith$Query$GetAllProducts$allProducts<TRes> get allProducts;
}

class _CopyWithImpl$Query$GetAllProducts<TRes>
    implements CopyWith$Query$GetAllProducts<TRes> {
  _CopyWithImpl$Query$GetAllProducts(this._instance, this._then);

  final Query$GetAllProducts _instance;

  final TRes Function(Query$GetAllProducts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? allProducts = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetAllProducts(
      allProducts: allProducts == _undefined || allProducts == null
          ? _instance.allProducts
          : (allProducts as Query$GetAllProducts$allProducts),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetAllProducts$allProducts<TRes> get allProducts {
    final local$allProducts = _instance.allProducts;
    return CopyWith$Query$GetAllProducts$allProducts(
      local$allProducts,
      (e) => call(allProducts: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetAllProducts<TRes>
    implements CopyWith$Query$GetAllProducts<TRes> {
  _CopyWithStubImpl$Query$GetAllProducts(this._res);

  TRes _res;

  call({Query$GetAllProducts$allProducts? allProducts, String? $__typename}) =>
      _res;

  CopyWith$Query$GetAllProducts$allProducts<TRes> get allProducts =>
      CopyWith$Query$GetAllProducts$allProducts.stub(_res);
}

const documentNodeQueryGetAllProducts = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetAllProducts'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'first')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'after')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'allProducts'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: VariableNode(name: NameNode(value: 'first')),
              ),
              ArgumentNode(
                name: NameNode(value: 'after'),
                value: VariableNode(name: NameNode(value: 'after')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'nodes'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'description'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'price'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'stock'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'category'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'createdAt'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: 'pageInfo'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'hasNextPage'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'endCursor'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Query$GetAllProducts _parserFn$Query$GetAllProducts(
  Map<String, dynamic> data,
) => Query$GetAllProducts.fromJson(data);
typedef OnQueryComplete$Query$GetAllProducts =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetAllProducts?);

class Options$Query$GetAllProducts
    extends graphql.QueryOptions<Query$GetAllProducts> {
  Options$Query$GetAllProducts({
    String? operationName,
    Variables$Query$GetAllProducts? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetAllProducts? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetAllProducts? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$GetAllProducts(data),
               ),
         onError: onError,
         document: documentNodeQueryGetAllProducts,
         parserFn: _parserFn$Query$GetAllProducts,
       );

  final OnQueryComplete$Query$GetAllProducts? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetAllProducts
    extends graphql.WatchQueryOptions<Query$GetAllProducts> {
  WatchOptions$Query$GetAllProducts({
    String? operationName,
    Variables$Query$GetAllProducts? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetAllProducts? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGetAllProducts,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetAllProducts,
       );
}

class FetchMoreOptions$Query$GetAllProducts extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetAllProducts({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetAllProducts? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryGetAllProducts,
       );
}

extension ClientExtension$Query$GetAllProducts on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetAllProducts>> query$GetAllProducts([
    Options$Query$GetAllProducts? options,
  ]) async => await this.query(options ?? Options$Query$GetAllProducts());

  graphql.ObservableQuery<Query$GetAllProducts> watchQuery$GetAllProducts([
    WatchOptions$Query$GetAllProducts? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetAllProducts());

  void writeQuery$GetAllProducts({
    required Query$GetAllProducts data,
    Variables$Query$GetAllProducts? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetAllProducts),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetAllProducts? readQuery$GetAllProducts({
    Variables$Query$GetAllProducts? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetAllProducts),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetAllProducts.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetAllProducts> useQuery$GetAllProducts([
  Options$Query$GetAllProducts? options,
]) => graphql_flutter.useQuery(options ?? Options$Query$GetAllProducts());
graphql.ObservableQuery<Query$GetAllProducts> useWatchQuery$GetAllProducts([
  WatchOptions$Query$GetAllProducts? options,
]) => graphql_flutter.useWatchQuery(
  options ?? WatchOptions$Query$GetAllProducts(),
);

class Query$GetAllProducts$Widget
    extends graphql_flutter.Query<Query$GetAllProducts> {
  Query$GetAllProducts$Widget({
    widgets.Key? key,
    Options$Query$GetAllProducts? options,
    required graphql_flutter.QueryBuilder<Query$GetAllProducts> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetAllProducts(),
         builder: builder,
       );
}

class Query$GetAllProducts$allProducts {
  Query$GetAllProducts$allProducts({
    required this.nodes,
    required this.pageInfo,
    this.$__typename = 'ProductConnection',
  });

  factory Query$GetAllProducts$allProducts.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetAllProducts$allProducts(
      nodes: (l$nodes as List<dynamic>)
          .map(
            (e) => Query$GetAllProducts$allProducts$nodes.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: Query$GetAllProducts$allProducts$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetAllProducts$allProducts$nodes> nodes;

  final Query$GetAllProducts$allProducts$pageInfo pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$nodes = nodes;
    _resultData['nodes'] = l$nodes.map((e) => e.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$nodes = nodes;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$nodes.map((v) => v)),
      l$pageInfo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetAllProducts$allProducts ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$nodes = nodes;
    final lOther$nodes = other.nodes;
    if (l$nodes.length != lOther$nodes.length) {
      return false;
    }
    for (int i = 0; i < l$nodes.length; i++) {
      final l$nodes$entry = l$nodes[i];
      final lOther$nodes$entry = lOther$nodes[i];
      if (l$nodes$entry != lOther$nodes$entry) {
        return false;
      }
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetAllProducts$allProducts
    on Query$GetAllProducts$allProducts {
  CopyWith$Query$GetAllProducts$allProducts<Query$GetAllProducts$allProducts>
  get copyWith => CopyWith$Query$GetAllProducts$allProducts(this, (i) => i);
}

abstract class CopyWith$Query$GetAllProducts$allProducts<TRes> {
  factory CopyWith$Query$GetAllProducts$allProducts(
    Query$GetAllProducts$allProducts instance,
    TRes Function(Query$GetAllProducts$allProducts) then,
  ) = _CopyWithImpl$Query$GetAllProducts$allProducts;

  factory CopyWith$Query$GetAllProducts$allProducts.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllProducts$allProducts;

  TRes call({
    List<Query$GetAllProducts$allProducts$nodes>? nodes,
    Query$GetAllProducts$allProducts$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes nodes(
    Iterable<Query$GetAllProducts$allProducts$nodes> Function(
      Iterable<
        CopyWith$Query$GetAllProducts$allProducts$nodes<
          Query$GetAllProducts$allProducts$nodes
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$GetAllProducts$allProducts$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetAllProducts$allProducts<TRes>
    implements CopyWith$Query$GetAllProducts$allProducts<TRes> {
  _CopyWithImpl$Query$GetAllProducts$allProducts(this._instance, this._then);

  final Query$GetAllProducts$allProducts _instance;

  final TRes Function(Query$GetAllProducts$allProducts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetAllProducts$allProducts(
      nodes: nodes == _undefined || nodes == null
          ? _instance.nodes
          : (nodes as List<Query$GetAllProducts$allProducts$nodes>),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$GetAllProducts$allProducts$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes nodes(
    Iterable<Query$GetAllProducts$allProducts$nodes> Function(
      Iterable<
        CopyWith$Query$GetAllProducts$allProducts$nodes<
          Query$GetAllProducts$allProducts$nodes
        >
      >,
    )
    _fn,
  ) => call(
    nodes: _fn(
      _instance.nodes.map(
        (e) => CopyWith$Query$GetAllProducts$allProducts$nodes(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$GetAllProducts$allProducts$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetAllProducts$allProducts$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetAllProducts$allProducts<TRes>
    implements CopyWith$Query$GetAllProducts$allProducts<TRes> {
  _CopyWithStubImpl$Query$GetAllProducts$allProducts(this._res);

  TRes _res;

  call({
    List<Query$GetAllProducts$allProducts$nodes>? nodes,
    Query$GetAllProducts$allProducts$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  nodes(_fn) => _res;

  CopyWith$Query$GetAllProducts$allProducts$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetAllProducts$allProducts$pageInfo.stub(_res);
}

class Query$GetAllProducts$allProducts$nodes {
  Query$GetAllProducts$allProducts$nodes({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.category,
    required this.createdAt,
    this.$__typename = 'Product',
  });

  factory Query$GetAllProducts$allProducts$nodes.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$price = json['price'];
    final l$stock = json['stock'];
    final l$category = json['category'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$GetAllProducts$allProducts$nodes(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String),
      price: (l$price as num).toDouble(),
      stock: (l$stock as int),
      category: (l$category as String),
      createdAt: (l$createdAt as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String description;

  final double price;

  final int stock;

  final String category;

  final String createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$stock = stock;
    _resultData['stock'] = l$stock;
    final l$category = category;
    _resultData['category'] = l$category;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$price = price;
    final l$stock = stock;
    final l$category = category;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$price,
      l$stock,
      l$category,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetAllProducts$allProducts$nodes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$stock = stock;
    final lOther$stock = other.stock;
    if (l$stock != lOther$stock) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetAllProducts$allProducts$nodes
    on Query$GetAllProducts$allProducts$nodes {
  CopyWith$Query$GetAllProducts$allProducts$nodes<
    Query$GetAllProducts$allProducts$nodes
  >
  get copyWith =>
      CopyWith$Query$GetAllProducts$allProducts$nodes(this, (i) => i);
}

abstract class CopyWith$Query$GetAllProducts$allProducts$nodes<TRes> {
  factory CopyWith$Query$GetAllProducts$allProducts$nodes(
    Query$GetAllProducts$allProducts$nodes instance,
    TRes Function(Query$GetAllProducts$allProducts$nodes) then,
  ) = _CopyWithImpl$Query$GetAllProducts$allProducts$nodes;

  factory CopyWith$Query$GetAllProducts$allProducts$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllProducts$allProducts$nodes;

  TRes call({
    String? id,
    String? name,
    String? description,
    double? price,
    int? stock,
    String? category,
    String? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetAllProducts$allProducts$nodes<TRes>
    implements CopyWith$Query$GetAllProducts$allProducts$nodes<TRes> {
  _CopyWithImpl$Query$GetAllProducts$allProducts$nodes(
    this._instance,
    this._then,
  );

  final Query$GetAllProducts$allProducts$nodes _instance;

  final TRes Function(Query$GetAllProducts$allProducts$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? price = _undefined,
    Object? stock = _undefined,
    Object? category = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetAllProducts$allProducts$nodes(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined || description == null
          ? _instance.description
          : (description as String),
      price: price == _undefined || price == null
          ? _instance.price
          : (price as double),
      stock: stock == _undefined || stock == null
          ? _instance.stock
          : (stock as int),
      category: category == _undefined || category == null
          ? _instance.category
          : (category as String),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetAllProducts$allProducts$nodes<TRes>
    implements CopyWith$Query$GetAllProducts$allProducts$nodes<TRes> {
  _CopyWithStubImpl$Query$GetAllProducts$allProducts$nodes(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    double? price,
    int? stock,
    String? category,
    String? createdAt,
    String? $__typename,
  }) => _res;
}

class Query$GetAllProducts$allProducts$pageInfo {
  Query$GetAllProducts$allProducts$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$GetAllProducts$allProducts$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetAllProducts$allProducts$pageInfo(
      hasNextPage: (l$hasNextPage as bool),
      endCursor: (l$endCursor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final String? endCursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$endCursor = endCursor;
    final l$$__typename = $__typename;
    return Object.hashAll([l$hasNextPage, l$endCursor, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetAllProducts$allProducts$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetAllProducts$allProducts$pageInfo
    on Query$GetAllProducts$allProducts$pageInfo {
  CopyWith$Query$GetAllProducts$allProducts$pageInfo<
    Query$GetAllProducts$allProducts$pageInfo
  >
  get copyWith =>
      CopyWith$Query$GetAllProducts$allProducts$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$GetAllProducts$allProducts$pageInfo<TRes> {
  factory CopyWith$Query$GetAllProducts$allProducts$pageInfo(
    Query$GetAllProducts$allProducts$pageInfo instance,
    TRes Function(Query$GetAllProducts$allProducts$pageInfo) then,
  ) = _CopyWithImpl$Query$GetAllProducts$allProducts$pageInfo;

  factory CopyWith$Query$GetAllProducts$allProducts$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllProducts$allProducts$pageInfo;

  TRes call({bool? hasNextPage, String? endCursor, String? $__typename});
}

class _CopyWithImpl$Query$GetAllProducts$allProducts$pageInfo<TRes>
    implements CopyWith$Query$GetAllProducts$allProducts$pageInfo<TRes> {
  _CopyWithImpl$Query$GetAllProducts$allProducts$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetAllProducts$allProducts$pageInfo _instance;

  final TRes Function(Query$GetAllProducts$allProducts$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetAllProducts$allProducts$pageInfo(
      hasNextPage: hasNextPage == _undefined || hasNextPage == null
          ? _instance.hasNextPage
          : (hasNextPage as bool),
      endCursor: endCursor == _undefined
          ? _instance.endCursor
          : (endCursor as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetAllProducts$allProducts$pageInfo<TRes>
    implements CopyWith$Query$GetAllProducts$allProducts$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetAllProducts$allProducts$pageInfo(this._res);

  TRes _res;

  call({bool? hasNextPage, String? endCursor, String? $__typename}) => _res;
}

class Variables$Mutation$Login {
  factory Variables$Mutation$Login({
    required String email,
    required String password,
  }) => Variables$Mutation$Login._({r'email': email, r'password': password});

  Variables$Mutation$Login._(this._$data);

  factory Variables$Mutation$Login.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    return Variables$Mutation$Login._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get password => (_$data['password'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    return result$data;
  }

  CopyWith$Variables$Mutation$Login<Variables$Mutation$Login> get copyWith =>
      CopyWith$Variables$Mutation$Login(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$Login ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$password = password;
    return Object.hashAll([l$email, l$password]);
  }
}

abstract class CopyWith$Variables$Mutation$Login<TRes> {
  factory CopyWith$Variables$Mutation$Login(
    Variables$Mutation$Login instance,
    TRes Function(Variables$Mutation$Login) then,
  ) = _CopyWithImpl$Variables$Mutation$Login;

  factory CopyWith$Variables$Mutation$Login.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$Login;

  TRes call({String? email, String? password});
}

class _CopyWithImpl$Variables$Mutation$Login<TRes>
    implements CopyWith$Variables$Mutation$Login<TRes> {
  _CopyWithImpl$Variables$Mutation$Login(this._instance, this._then);

  final Variables$Mutation$Login _instance;

  final TRes Function(Variables$Mutation$Login) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? email = _undefined, Object? password = _undefined}) =>
      _then(
        Variables$Mutation$Login._({
          ..._instance._$data,
          if (email != _undefined && email != null) 'email': (email as String),
          if (password != _undefined && password != null)
            'password': (password as String),
        }),
      );
}

class _CopyWithStubImpl$Variables$Mutation$Login<TRes>
    implements CopyWith$Variables$Mutation$Login<TRes> {
  _CopyWithStubImpl$Variables$Mutation$Login(this._res);

  TRes _res;

  call({String? email, String? password}) => _res;
}

class Mutation$Login {
  Mutation$Login({required this.login, this.$__typename = 'Mutation'});

  factory Mutation$Login.fromJson(Map<String, dynamic> json) {
    final l$login = json['login'];
    final l$$__typename = json['__typename'];
    return Mutation$Login(
      login: Mutation$Login$login.fromJson((l$login as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$Login$login login;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$login = login;
    _resultData['login'] = l$login.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$login = login;
    final l$$__typename = $__typename;
    return Object.hashAll([l$login, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Login || runtimeType != other.runtimeType) {
      return false;
    }
    final l$login = login;
    final lOther$login = other.login;
    if (l$login != lOther$login) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$Login on Mutation$Login {
  CopyWith$Mutation$Login<Mutation$Login> get copyWith =>
      CopyWith$Mutation$Login(this, (i) => i);
}

abstract class CopyWith$Mutation$Login<TRes> {
  factory CopyWith$Mutation$Login(
    Mutation$Login instance,
    TRes Function(Mutation$Login) then,
  ) = _CopyWithImpl$Mutation$Login;

  factory CopyWith$Mutation$Login.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Login;

  TRes call({Mutation$Login$login? login, String? $__typename});
  CopyWith$Mutation$Login$login<TRes> get login;
}

class _CopyWithImpl$Mutation$Login<TRes>
    implements CopyWith$Mutation$Login<TRes> {
  _CopyWithImpl$Mutation$Login(this._instance, this._then);

  final Mutation$Login _instance;

  final TRes Function(Mutation$Login) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? login = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$Login(
          login: login == _undefined || login == null
              ? _instance.login
              : (login as Mutation$Login$login),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Mutation$Login$login<TRes> get login {
    final local$login = _instance.login;
    return CopyWith$Mutation$Login$login(local$login, (e) => call(login: e));
  }
}

class _CopyWithStubImpl$Mutation$Login<TRes>
    implements CopyWith$Mutation$Login<TRes> {
  _CopyWithStubImpl$Mutation$Login(this._res);

  TRes _res;

  call({Mutation$Login$login? login, String? $__typename}) => _res;

  CopyWith$Mutation$Login$login<TRes> get login =>
      CopyWith$Mutation$Login$login.stub(_res);
}

const documentNodeMutationLogin = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'Login'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'email')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'password')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'login'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'email'),
                value: VariableNode(name: NameNode(value: 'email')),
              ),
              ArgumentNode(
                name: NameNode(value: 'passwordPlain'),
                value: VariableNode(name: NameNode(value: 'password')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'token'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'user'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'email'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Mutation$Login _parserFn$Mutation$Login(Map<String, dynamic> data) =>
    Mutation$Login.fromJson(data);
typedef OnMutationCompleted$Mutation$Login =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$Login?);

class Options$Mutation$Login extends graphql.MutationOptions<Mutation$Login> {
  Options$Mutation$Login({
    String? operationName,
    required Variables$Mutation$Login variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Login? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Login? onCompleted,
    graphql.OnMutationUpdate<Mutation$Login>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$Login(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationLogin,
         parserFn: _parserFn$Mutation$Login,
       );

  final OnMutationCompleted$Mutation$Login? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$Login
    extends graphql.WatchQueryOptions<Mutation$Login> {
  WatchOptions$Mutation$Login({
    String? operationName,
    required Variables$Mutation$Login variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Login? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationLogin,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$Login,
       );
}

extension ClientExtension$Mutation$Login on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$Login>> mutate$Login(
    Options$Mutation$Login options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$Login> watchMutation$Login(
    WatchOptions$Mutation$Login options,
  ) => this.watchMutation(options);
}

class Mutation$Login$HookResult {
  Mutation$Login$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$Login runMutation;

  final graphql.QueryResult<Mutation$Login> result;
}

Mutation$Login$HookResult useMutation$Login([
  WidgetOptions$Mutation$Login? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$Login(),
  );
  return Mutation$Login$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$Login> useWatchMutation$Login(
  WatchOptions$Mutation$Login options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$Login
    extends graphql.MutationOptions<Mutation$Login> {
  WidgetOptions$Mutation$Login({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Login? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Login? onCompleted,
    graphql.OnMutationUpdate<Mutation$Login>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$Login(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationLogin,
         parserFn: _parserFn$Mutation$Login,
       );

  final OnMutationCompleted$Mutation$Login? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$Login =
    graphql.MultiSourceResult<Mutation$Login> Function(
      Variables$Mutation$Login, {
      Object? optimisticResult,
      Mutation$Login? typedOptimisticResult,
    });
typedef Builder$Mutation$Login =
    widgets.Widget Function(
      RunMutation$Mutation$Login,
      graphql.QueryResult<Mutation$Login>?,
    );

class Mutation$Login$Widget extends graphql_flutter.Mutation<Mutation$Login> {
  Mutation$Login$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$Login? options,
    required Builder$Mutation$Login builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$Login(),
         builder: (run, result) => builder(
           (variables, {optimisticResult, typedOptimisticResult}) => run(
             variables.toJson(),
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}

class Mutation$Login$login {
  Mutation$Login$login({
    required this.token,
    required this.user,
    this.$__typename = 'AuthPayload',
  });

  factory Mutation$Login$login.fromJson(Map<String, dynamic> json) {
    final l$token = json['token'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$Login$login(
      token: (l$token as String),
      user: Mutation$Login$login$user.fromJson(
        (l$user as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final String token;

  final Mutation$Login$login$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$token = token;
    _resultData['token'] = l$token;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([l$token, l$user, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Login$login || runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$Login$login on Mutation$Login$login {
  CopyWith$Mutation$Login$login<Mutation$Login$login> get copyWith =>
      CopyWith$Mutation$Login$login(this, (i) => i);
}

abstract class CopyWith$Mutation$Login$login<TRes> {
  factory CopyWith$Mutation$Login$login(
    Mutation$Login$login instance,
    TRes Function(Mutation$Login$login) then,
  ) = _CopyWithImpl$Mutation$Login$login;

  factory CopyWith$Mutation$Login$login.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Login$login;

  TRes call({
    String? token,
    Mutation$Login$login$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$Login$login$user<TRes> get user;
}

class _CopyWithImpl$Mutation$Login$login<TRes>
    implements CopyWith$Mutation$Login$login<TRes> {
  _CopyWithImpl$Mutation$Login$login(this._instance, this._then);

  final Mutation$Login$login _instance;

  final TRes Function(Mutation$Login$login) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? token = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$Login$login(
      token: token == _undefined || token == null
          ? _instance.token
          : (token as String),
      user: user == _undefined || user == null
          ? _instance.user
          : (user as Mutation$Login$login$user),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$Login$login$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$Login$login$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$Login$login<TRes>
    implements CopyWith$Mutation$Login$login<TRes> {
  _CopyWithStubImpl$Mutation$Login$login(this._res);

  TRes _res;

  call({String? token, Mutation$Login$login$user? user, String? $__typename}) =>
      _res;

  CopyWith$Mutation$Login$login$user<TRes> get user =>
      CopyWith$Mutation$Login$login$user.stub(_res);
}

class Mutation$Login$login$user {
  Mutation$Login$login$user({
    required this.id,
    required this.email,
    this.name,
    this.$__typename = 'User',
  });

  factory Mutation$Login$login$user.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$Login$login$user(
      id: (l$id as String),
      email: (l$email as String),
      name: (l$name as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$email, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Login$login$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$Login$login$user
    on Mutation$Login$login$user {
  CopyWith$Mutation$Login$login$user<Mutation$Login$login$user> get copyWith =>
      CopyWith$Mutation$Login$login$user(this, (i) => i);
}

abstract class CopyWith$Mutation$Login$login$user<TRes> {
  factory CopyWith$Mutation$Login$login$user(
    Mutation$Login$login$user instance,
    TRes Function(Mutation$Login$login$user) then,
  ) = _CopyWithImpl$Mutation$Login$login$user;

  factory CopyWith$Mutation$Login$login$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Login$login$user;

  TRes call({String? id, String? email, String? name, String? $__typename});
}

class _CopyWithImpl$Mutation$Login$login$user<TRes>
    implements CopyWith$Mutation$Login$login$user<TRes> {
  _CopyWithImpl$Mutation$Login$login$user(this._instance, this._then);

  final Mutation$Login$login$user _instance;

  final TRes Function(Mutation$Login$login$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$Login$login$user(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      name: name == _undefined ? _instance.name : (name as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$Login$login$user<TRes>
    implements CopyWith$Mutation$Login$login$user<TRes> {
  _CopyWithStubImpl$Mutation$Login$login$user(this._res);

  TRes _res;

  call({String? id, String? email, String? name, String? $__typename}) => _res;
}

class Variables$Mutation$Register {
  factory Variables$Mutation$Register({
    required String email,
    required String passwordPlain,
  }) => Variables$Mutation$Register._({
    r'email': email,
    r'passwordPlain': passwordPlain,
  });

  Variables$Mutation$Register._(this._$data);

  factory Variables$Mutation$Register.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$passwordPlain = data['passwordPlain'];
    result$data['passwordPlain'] = (l$passwordPlain as String);
    return Variables$Mutation$Register._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get passwordPlain => (_$data['passwordPlain'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$passwordPlain = passwordPlain;
    result$data['passwordPlain'] = l$passwordPlain;
    return result$data;
  }

  CopyWith$Variables$Mutation$Register<Variables$Mutation$Register>
  get copyWith => CopyWith$Variables$Mutation$Register(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$Register ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$passwordPlain = passwordPlain;
    final lOther$passwordPlain = other.passwordPlain;
    if (l$passwordPlain != lOther$passwordPlain) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$passwordPlain = passwordPlain;
    return Object.hashAll([l$email, l$passwordPlain]);
  }
}

abstract class CopyWith$Variables$Mutation$Register<TRes> {
  factory CopyWith$Variables$Mutation$Register(
    Variables$Mutation$Register instance,
    TRes Function(Variables$Mutation$Register) then,
  ) = _CopyWithImpl$Variables$Mutation$Register;

  factory CopyWith$Variables$Mutation$Register.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$Register;

  TRes call({String? email, String? passwordPlain});
}

class _CopyWithImpl$Variables$Mutation$Register<TRes>
    implements CopyWith$Variables$Mutation$Register<TRes> {
  _CopyWithImpl$Variables$Mutation$Register(this._instance, this._then);

  final Variables$Mutation$Register _instance;

  final TRes Function(Variables$Mutation$Register) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? email = _undefined, Object? passwordPlain = _undefined}) =>
      _then(
        Variables$Mutation$Register._({
          ..._instance._$data,
          if (email != _undefined && email != null) 'email': (email as String),
          if (passwordPlain != _undefined && passwordPlain != null)
            'passwordPlain': (passwordPlain as String),
        }),
      );
}

class _CopyWithStubImpl$Variables$Mutation$Register<TRes>
    implements CopyWith$Variables$Mutation$Register<TRes> {
  _CopyWithStubImpl$Variables$Mutation$Register(this._res);

  TRes _res;

  call({String? email, String? passwordPlain}) => _res;
}

class Mutation$Register {
  Mutation$Register({required this.register, this.$__typename = 'Mutation'});

  factory Mutation$Register.fromJson(Map<String, dynamic> json) {
    final l$register = json['register'];
    final l$$__typename = json['__typename'];
    return Mutation$Register(
      register: Mutation$Register$register.fromJson(
        (l$register as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$Register$register register;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$register = register;
    _resultData['register'] = l$register.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$register = register;
    final l$$__typename = $__typename;
    return Object.hashAll([l$register, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Register || runtimeType != other.runtimeType) {
      return false;
    }
    final l$register = register;
    final lOther$register = other.register;
    if (l$register != lOther$register) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$Register on Mutation$Register {
  CopyWith$Mutation$Register<Mutation$Register> get copyWith =>
      CopyWith$Mutation$Register(this, (i) => i);
}

abstract class CopyWith$Mutation$Register<TRes> {
  factory CopyWith$Mutation$Register(
    Mutation$Register instance,
    TRes Function(Mutation$Register) then,
  ) = _CopyWithImpl$Mutation$Register;

  factory CopyWith$Mutation$Register.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Register;

  TRes call({Mutation$Register$register? register, String? $__typename});
  CopyWith$Mutation$Register$register<TRes> get register;
}

class _CopyWithImpl$Mutation$Register<TRes>
    implements CopyWith$Mutation$Register<TRes> {
  _CopyWithImpl$Mutation$Register(this._instance, this._then);

  final Mutation$Register _instance;

  final TRes Function(Mutation$Register) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? register = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$Register(
      register: register == _undefined || register == null
          ? _instance.register
          : (register as Mutation$Register$register),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$Register$register<TRes> get register {
    final local$register = _instance.register;
    return CopyWith$Mutation$Register$register(
      local$register,
      (e) => call(register: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$Register<TRes>
    implements CopyWith$Mutation$Register<TRes> {
  _CopyWithStubImpl$Mutation$Register(this._res);

  TRes _res;

  call({Mutation$Register$register? register, String? $__typename}) => _res;

  CopyWith$Mutation$Register$register<TRes> get register =>
      CopyWith$Mutation$Register$register.stub(_res);
}

const documentNodeMutationRegister = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'Register'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'email')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'passwordPlain')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'register'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'email'),
                value: VariableNode(name: NameNode(value: 'email')),
              ),
              ArgumentNode(
                name: NameNode(value: 'passwordPlain'),
                value: VariableNode(name: NameNode(value: 'passwordPlain')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'token'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'user'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'email'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Mutation$Register _parserFn$Mutation$Register(Map<String, dynamic> data) =>
    Mutation$Register.fromJson(data);
typedef OnMutationCompleted$Mutation$Register =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$Register?);

class Options$Mutation$Register
    extends graphql.MutationOptions<Mutation$Register> {
  Options$Mutation$Register({
    String? operationName,
    required Variables$Mutation$Register variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Register? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Register? onCompleted,
    graphql.OnMutationUpdate<Mutation$Register>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$Register(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationRegister,
         parserFn: _parserFn$Mutation$Register,
       );

  final OnMutationCompleted$Mutation$Register? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$Register
    extends graphql.WatchQueryOptions<Mutation$Register> {
  WatchOptions$Mutation$Register({
    String? operationName,
    required Variables$Mutation$Register variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Register? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationRegister,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$Register,
       );
}

extension ClientExtension$Mutation$Register on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$Register>> mutate$Register(
    Options$Mutation$Register options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$Register> watchMutation$Register(
    WatchOptions$Mutation$Register options,
  ) => this.watchMutation(options);
}

class Mutation$Register$HookResult {
  Mutation$Register$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$Register runMutation;

  final graphql.QueryResult<Mutation$Register> result;
}

Mutation$Register$HookResult useMutation$Register([
  WidgetOptions$Mutation$Register? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$Register(),
  );
  return Mutation$Register$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$Register> useWatchMutation$Register(
  WatchOptions$Mutation$Register options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$Register
    extends graphql.MutationOptions<Mutation$Register> {
  WidgetOptions$Mutation$Register({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Register? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Register? onCompleted,
    graphql.OnMutationUpdate<Mutation$Register>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$Register(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationRegister,
         parserFn: _parserFn$Mutation$Register,
       );

  final OnMutationCompleted$Mutation$Register? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$Register =
    graphql.MultiSourceResult<Mutation$Register> Function(
      Variables$Mutation$Register, {
      Object? optimisticResult,
      Mutation$Register? typedOptimisticResult,
    });
typedef Builder$Mutation$Register =
    widgets.Widget Function(
      RunMutation$Mutation$Register,
      graphql.QueryResult<Mutation$Register>?,
    );

class Mutation$Register$Widget
    extends graphql_flutter.Mutation<Mutation$Register> {
  Mutation$Register$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$Register? options,
    required Builder$Mutation$Register builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$Register(),
         builder: (run, result) => builder(
           (variables, {optimisticResult, typedOptimisticResult}) => run(
             variables.toJson(),
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}

class Mutation$Register$register {
  Mutation$Register$register({
    required this.token,
    required this.user,
    this.$__typename = 'AuthPayload',
  });

  factory Mutation$Register$register.fromJson(Map<String, dynamic> json) {
    final l$token = json['token'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$Register$register(
      token: (l$token as String),
      user: Mutation$Register$register$user.fromJson(
        (l$user as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final String token;

  final Mutation$Register$register$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$token = token;
    _resultData['token'] = l$token;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([l$token, l$user, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Register$register ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$Register$register
    on Mutation$Register$register {
  CopyWith$Mutation$Register$register<Mutation$Register$register>
  get copyWith => CopyWith$Mutation$Register$register(this, (i) => i);
}

abstract class CopyWith$Mutation$Register$register<TRes> {
  factory CopyWith$Mutation$Register$register(
    Mutation$Register$register instance,
    TRes Function(Mutation$Register$register) then,
  ) = _CopyWithImpl$Mutation$Register$register;

  factory CopyWith$Mutation$Register$register.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Register$register;

  TRes call({
    String? token,
    Mutation$Register$register$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$Register$register$user<TRes> get user;
}

class _CopyWithImpl$Mutation$Register$register<TRes>
    implements CopyWith$Mutation$Register$register<TRes> {
  _CopyWithImpl$Mutation$Register$register(this._instance, this._then);

  final Mutation$Register$register _instance;

  final TRes Function(Mutation$Register$register) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? token = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$Register$register(
      token: token == _undefined || token == null
          ? _instance.token
          : (token as String),
      user: user == _undefined || user == null
          ? _instance.user
          : (user as Mutation$Register$register$user),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$Register$register$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$Register$register$user(
      local$user,
      (e) => call(user: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$Register$register<TRes>
    implements CopyWith$Mutation$Register$register<TRes> {
  _CopyWithStubImpl$Mutation$Register$register(this._res);

  TRes _res;

  call({
    String? token,
    Mutation$Register$register$user? user,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$Register$register$user<TRes> get user =>
      CopyWith$Mutation$Register$register$user.stub(_res);
}

class Mutation$Register$register$user {
  Mutation$Register$register$user({
    required this.id,
    required this.email,
    this.name,
    this.$__typename = 'User',
  });

  factory Mutation$Register$register$user.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$Register$register$user(
      id: (l$id as String),
      email: (l$email as String),
      name: (l$name as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$email, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Register$register$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$Register$register$user
    on Mutation$Register$register$user {
  CopyWith$Mutation$Register$register$user<Mutation$Register$register$user>
  get copyWith => CopyWith$Mutation$Register$register$user(this, (i) => i);
}

abstract class CopyWith$Mutation$Register$register$user<TRes> {
  factory CopyWith$Mutation$Register$register$user(
    Mutation$Register$register$user instance,
    TRes Function(Mutation$Register$register$user) then,
  ) = _CopyWithImpl$Mutation$Register$register$user;

  factory CopyWith$Mutation$Register$register$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Register$register$user;

  TRes call({String? id, String? email, String? name, String? $__typename});
}

class _CopyWithImpl$Mutation$Register$register$user<TRes>
    implements CopyWith$Mutation$Register$register$user<TRes> {
  _CopyWithImpl$Mutation$Register$register$user(this._instance, this._then);

  final Mutation$Register$register$user _instance;

  final TRes Function(Mutation$Register$register$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$Register$register$user(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      name: name == _undefined ? _instance.name : (name as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$Register$register$user<TRes>
    implements CopyWith$Mutation$Register$register$user<TRes> {
  _CopyWithStubImpl$Mutation$Register$register$user(this._res);

  TRes _res;

  call({String? id, String? email, String? name, String? $__typename}) => _res;
}

class Query$Me {
  Query$Me({this.me, this.$__typename = 'Query'});

  factory Query$Me.fromJson(Map<String, dynamic> json) {
    final l$me = json['me'];
    final l$$__typename = json['__typename'];
    return Query$Me(
      me: l$me == null
          ? null
          : Query$Me$me.fromJson((l$me as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Me$me? me;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$me = me;
    _resultData['me'] = l$me?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$me = me;
    final l$$__typename = $__typename;
    return Object.hashAll([l$me, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Me || runtimeType != other.runtimeType) {
      return false;
    }
    final l$me = me;
    final lOther$me = other.me;
    if (l$me != lOther$me) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Me on Query$Me {
  CopyWith$Query$Me<Query$Me> get copyWith => CopyWith$Query$Me(this, (i) => i);
}

abstract class CopyWith$Query$Me<TRes> {
  factory CopyWith$Query$Me(Query$Me instance, TRes Function(Query$Me) then) =
      _CopyWithImpl$Query$Me;

  factory CopyWith$Query$Me.stub(TRes res) = _CopyWithStubImpl$Query$Me;

  TRes call({Query$Me$me? me, String? $__typename});
  CopyWith$Query$Me$me<TRes> get me;
}

class _CopyWithImpl$Query$Me<TRes> implements CopyWith$Query$Me<TRes> {
  _CopyWithImpl$Query$Me(this._instance, this._then);

  final Query$Me _instance;

  final TRes Function(Query$Me) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? me = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$Me(
          me: me == _undefined ? _instance.me : (me as Query$Me$me?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$Me$me<TRes> get me {
    final local$me = _instance.me;
    return local$me == null
        ? CopyWith$Query$Me$me.stub(_then(_instance))
        : CopyWith$Query$Me$me(local$me, (e) => call(me: e));
  }
}

class _CopyWithStubImpl$Query$Me<TRes> implements CopyWith$Query$Me<TRes> {
  _CopyWithStubImpl$Query$Me(this._res);

  TRes _res;

  call({Query$Me$me? me, String? $__typename}) => _res;

  CopyWith$Query$Me$me<TRes> get me => CopyWith$Query$Me$me.stub(_res);
}

const documentNodeQueryMe = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Me'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'me'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'email'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Query$Me _parserFn$Query$Me(Map<String, dynamic> data) =>
    Query$Me.fromJson(data);
typedef OnQueryComplete$Query$Me =
    FutureOr<void> Function(Map<String, dynamic>?, Query$Me?);

class Options$Query$Me extends graphql.QueryOptions<Query$Me> {
  Options$Query$Me({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Me? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Me? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$Me(data),
               ),
         onError: onError,
         document: documentNodeQueryMe,
         parserFn: _parserFn$Query$Me,
       );

  final OnQueryComplete$Query$Me? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$Me extends graphql.WatchQueryOptions<Query$Me> {
  WatchOptions$Query$Me({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Me? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryMe,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$Me,
       );
}

class FetchMoreOptions$Query$Me extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Me({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryMe);
}

extension ClientExtension$Query$Me on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Me>> query$Me([
    Options$Query$Me? options,
  ]) async => await this.query(options ?? Options$Query$Me());

  graphql.ObservableQuery<Query$Me> watchQuery$Me([
    WatchOptions$Query$Me? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$Me());

  void writeQuery$Me({required Query$Me data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryMe),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );

  Query$Me? readQuery$Me({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMe),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Me.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Me> useQuery$Me([
  Options$Query$Me? options,
]) => graphql_flutter.useQuery(options ?? Options$Query$Me());
graphql.ObservableQuery<Query$Me> useWatchQuery$Me([
  WatchOptions$Query$Me? options,
]) => graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Me());

class Query$Me$Widget extends graphql_flutter.Query<Query$Me> {
  Query$Me$Widget({
    widgets.Key? key,
    Options$Query$Me? options,
    required graphql_flutter.QueryBuilder<Query$Me> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$Me(),
         builder: builder,
       );
}

class Query$Me$me {
  Query$Me$me({
    required this.id,
    required this.email,
    this.name,
    this.$__typename = 'User',
  });

  factory Query$Me$me.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$Me$me(
      id: (l$id as String),
      email: (l$email as String),
      name: (l$name as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$email, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Me$me || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Me$me on Query$Me$me {
  CopyWith$Query$Me$me<Query$Me$me> get copyWith =>
      CopyWith$Query$Me$me(this, (i) => i);
}

abstract class CopyWith$Query$Me$me<TRes> {
  factory CopyWith$Query$Me$me(
    Query$Me$me instance,
    TRes Function(Query$Me$me) then,
  ) = _CopyWithImpl$Query$Me$me;

  factory CopyWith$Query$Me$me.stub(TRes res) = _CopyWithStubImpl$Query$Me$me;

  TRes call({String? id, String? email, String? name, String? $__typename});
}

class _CopyWithImpl$Query$Me$me<TRes> implements CopyWith$Query$Me$me<TRes> {
  _CopyWithImpl$Query$Me$me(this._instance, this._then);

  final Query$Me$me _instance;

  final TRes Function(Query$Me$me) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Me$me(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      name: name == _undefined ? _instance.name : (name as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Me$me<TRes>
    implements CopyWith$Query$Me$me<TRes> {
  _CopyWithStubImpl$Query$Me$me(this._res);

  TRes _res;

  call({String? id, String? email, String? name, String? $__typename}) => _res;
}
