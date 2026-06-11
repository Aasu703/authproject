import 'package:authproject/features/items/domain/entities/item.dart';
import 'package:authproject/features/items/domain/usecases/get_items_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

// Events
abstract class ItemEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchItems extends ItemEvent {}

// State
enum ItemStatus { initial, success, failure }

class ItemState extends Equatable {
  final ItemStatus status;
  final List<Product> items;
  final bool hasReachedMax;
  final String? endCursor;
  final String? errorMessage;

  const ItemState({
    this.status = ItemStatus.initial,
    this.items = const <Product>[],
    this.hasReachedMax = false,
    this.endCursor,
    this.errorMessage,
  });

  ItemState copyWith({
    ItemStatus? status,
    List<Product>? items,
    bool? hasReachedMax,
    String? endCursor,
    String? errorMessage,
  }) {
    return ItemState(
      status: status ?? this.status,
      items: items ?? this.items,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      endCursor: endCursor ?? this.endCursor,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, items, hasReachedMax, endCursor, errorMessage];
}

// Bloc
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return events.throttle(duration).switchMap(mapper);
  };
}

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final GetItemsUseCase getItemsUseCase;

  ItemBloc({required this.getItemsUseCase}) : super(const ItemState()) {
    on<FetchItems>(
      _onFetchItems,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onFetchItems(FetchItems event, Emitter<ItemState> emit) async {
    if (state.hasReachedMax) return;

    final result = await getItemsUseCase(
      GetItemsParams(first: 20, after: state.endCursor),
    );

    result.fold(
      (failure) {
        if (state.items.isEmpty) {
          emit(state.copyWith(
            status: ItemStatus.failure,
            errorMessage: failure.message,
          ));
        } else {
          // Keep existing items but record the error
          emit(state.copyWith(
            errorMessage: failure.message,
          ));
        }
      },
      (connection) {
        emit(state.copyWith(
          status: ItemStatus.success,
          items: List.of(state.items)..addAll(connection.products),
          hasReachedMax: !connection.pageInfo.hasNextPage,
          endCursor: connection.pageInfo.endCursor,
          errorMessage: null, // Clear error on success
        ));
      },
    );
  }
}
