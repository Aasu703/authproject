import 'package:authproject/features/items/data/models/item_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class ItemRemoteDataSource {
  Future<ProductConnectionModel> getProducts({int? first, String? after});
}

class ProductConnectionModel {
  final List<ProductModel> products;
  final PageInfoModel pageInfo;

  ProductConnectionModel({required this.products, required this.pageInfo});

  factory ProductConnectionModel.fromJson(Map<String, dynamic> json) {
    return ProductConnectionModel(
      products: (json['nodes'] as List)
          .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      pageInfo: PageInfoModel.fromJson(json['pageInfo'] as Map<String, dynamic>),
    );
  }
}

class PageInfoModel {
  final bool hasNextPage;
  final String? endCursor;

  PageInfoModel({required this.hasNextPage, this.endCursor});

  factory PageInfoModel.fromJson(Map<String, dynamic> json) {
    return PageInfoModel(
      hasNextPage: json['hasNextPage'] as bool,
      endCursor: json['endCursor'] as String?,
    );
  }
}

class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  final GraphQLClient client;

  ItemRemoteDataSourceImpl({required this.client});

  @override
  Future<ProductConnectionModel> getProducts({int? first, String? after}) async {
    const String query = r'''
      query GetAllProducts($first: Int, $after: String) {
        allProducts(first: $first, after: $after) {
          pageInfo {
            hasNextPage
            endCursor
          }
          nodes {
            id
            name
            description
            price
            stock
            category
            createdAt
          }
        }
      }
    ''';

    final options = QueryOptions(
      document: gql(query),
      variables: {
        'first': first,
        'after': after,
      },
      fetchPolicy: FetchPolicy.networkOnly,
    );

    final result = await client.query(options);

    if (result.hasException) {
      throw result.exception!;
    }

    return ProductConnectionModel.fromJson(
      result.data!['allProducts'] as Map<String, dynamic>,
    );
  }
}
