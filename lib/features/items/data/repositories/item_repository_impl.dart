import 'package:authproject/core/errors/failures.dart';
import 'package:authproject/features/items/data/datasources/item_remote_datasource.dart';
import 'package:authproject/features/items/domain/repositories/item_repository.dart';
import 'package:dartz/dartz.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteDataSource remoteDataSource;

  ItemRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ItemConnection>> getItems({
    int? first,
    String? after,
  }) async {
    try {
      final remoteData = await remoteDataSource.getItems(
        first: first,
        after: after,
      );
      
      return Right(ItemConnection(
        items: remoteData.items,
        pageInfo: PageInfo(
          hasNextPage: remoteData.pageInfo.hasNextPage,
          endCursor: remoteData.pageInfo.endCursor,
        ),
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
