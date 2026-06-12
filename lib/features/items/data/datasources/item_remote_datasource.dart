import 'package:authproject/features/items/data/models/item_model.dart';
import 'package:authproject/graphql/queries.graphql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class ItemRemoteDataSource {
  Future<ItemConnectionModel> getItems({int? first, String? after});
}

class ItemConnectionModel {
  final List<ItemModel> items;
  final PageInfoModel pageInfo;

  ItemConnectionModel({required this.items, required this.pageInfo});

  factory ItemConnectionModel.fromJson(Map<String, dynamic> json) {
    return ItemConnectionModel(
      items: (json['nodes'] as List)
          .map((item) => ItemModel.fromJson(item as Map<String, dynamic>))
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
  Future<ItemConnectionModel> getItems({int? first, String? after}) async {
    final result = await client.query$GetAllProducts(
      Options$Query$GetAllProducts(
        variables: Variables$Query$GetAllProducts(
          first: first,
          after: after,
        ),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    final data = result.parsedData?.allProducts;
    if (data == null) {
      throw Exception('Empty response returned from allProducts');
    }

    return ItemConnectionModel(
      items: data.nodes
          .map((node) => ItemModel(
                id: node.id,
                name: node.name,
                description: node.description,
                price: node.price,
                stock: node.stock,
                category: node.category,
                createdAt: node.createdAt,
              ))
          .toList(),
      pageInfo: PageInfoModel(
        hasNextPage: data.pageInfo.hasNextPage,
        endCursor: data.pageInfo.endCursor,
      ),
    );
  }
}
