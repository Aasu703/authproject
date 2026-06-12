import 'package:authproject/core/errors/failures.dart';
import 'package:authproject/features/items/domain/entities/item.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class ItemRepository {
  Future<Either<Failure, ItemConnection>> getItems({
    int? first,
    String? after,
  });
}

class ItemConnection extends Equatable {
  final List<Item> items;
  final PageInfo pageInfo;

  const ItemConnection({required this.items, required this.pageInfo});

  @override
  List<Object?> get props => [items, pageInfo];
}

class PageInfo extends Equatable {
  final bool hasNextPage;
  final String? endCursor;

  const PageInfo({required this.hasNextPage, this.endCursor});

  @override
  List<Object?> get props => [hasNextPage, endCursor];
}
