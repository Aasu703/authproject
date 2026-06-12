import 'package:authproject/core/errors/failures.dart';
import 'package:authproject/core/usecases/usecase.dart';
import 'package:authproject/features/items/domain/repositories/item_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetItemsUseCase implements UseCase<Either<Failure, ItemConnection>, GetItemsParams> {
  final ItemRepository repository;

  GetItemsUseCase(this.repository);

  @override
  Future<Either<Failure, ItemConnection>> call(GetItemsParams params) async {
    return await repository.getItems(first: params.first, after: params.after);
  }
}

class GetItemsParams extends Equatable {
  final int? first;
  final String? after;

  const GetItemsParams({this.first, this.after});

  @override
  List<Object?> get props => [first, after];
}
