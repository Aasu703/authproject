import 'package:authproject/core/errors/failures.dart';
import 'package:authproject/features/items/domain/entities/item.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class ItemRepository {
  Future<Either<Failure, ProductConnection>> getProducts({
    int? first,
    String? after,
  });
}

class ProductConnection extends Equatable {
  final List<Product> products;
  final PageInfo pageInfo;

  const ProductConnection({required this.products, required this.pageInfo});

  @override
  List<Object?> get props => [products, pageInfo];
}

class PageInfo extends Equatable {
  final bool hasNextPage;
  final String? endCursor;

  const PageInfo({required this.hasNextPage, this.endCursor});

  @override
  List<Object?> get props => [hasNextPage, endCursor];
}
